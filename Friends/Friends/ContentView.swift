
import SwiftUI
import CoreData
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    @State private var users = [User]()
    
    @State private var searchText = ""
    var searchUsers: [User]{
        if searchText == ""{
            return users
        }
        return users.filter{$0.name.contains(searchText)}
        
    }
    @State private var onlyActiveUsers = false
    
    var filterredUsers: [User]{
        onlyActiveUsers ? searchUsers.filter{$0.isActive == true} : searchUsers
    }
    
    var body: some View {
        NavigationStack{
            List(filterredUsers , id: \.id){ user in
                NavigationLink{
                    UserInformation(user: user)
                }label: {
                    Text(user.name)
                }
            }
            .task {
                if users.isEmpty{
                    await loadData()
                }
            }
            .navigationTitle("Users Profile List")
            .toolbar{
                ToolbarItemGroup{
                    Button("All"){
                        onlyActiveUsers = false
                    }
                    Button("Active"){
                        onlyActiveUsers = true
                    }
                }
            }
        }
        .searchable(text: $searchText)
        
    }
    //load JSON data from the URL and decode JSON
    func loadData()async{
        
        guard let URL = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid ULR")
            return
        }
        if let (data,_) = try? await URLSession.shared.data(from: URL){
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedData = try? decoder.decode([User].self, from: data){
                users = decodedData
                await MainActor.run{
                    //add usersFromURL to Core Data
                    
                    for user in decodedData {
                        
                        let cachedUser = CachedUser(context: moc)
                        cachedUser.id = user.id.uuidString
                        cachedUser.isActive = user.isActive
                        cachedUser.name = user.name
                        cachedUser.age = Int16(user.age)
                        cachedUser.company = user.company
                        cachedUser.email = user.email
                        cachedUser.address = user.address
                        cachedUser.about = user.about
                        cachedUser.registered = user.registered
                        cachedUser.tags = user.tags.joined(separator: ",")
                    
                        cachedUser.friends = NSSet(array: user.friends.map { friend in
                            let cachedFriend = CachedFriend(context: moc)
                            cachedFriend.id = friend.id.uuidString
                            cachedFriend.name = friend.name
                            return cachedFriend
                        })
                    }
                    try? moc.save()
                    
               }
            }
        }
        else{
            let CoreDataUsers = cachedUsers.map { CachedUser in
                //wrappedFreinds->Friend
                let friends = CachedUser.wrappedFriends.map{friend in
                    Friend(id: friend.wrappedId, name: friend.wrappedName)
                }
                return User(id: CachedUser.wrappedId, isActive: CachedUser.isActive, name: CachedUser.wrappedName, age: CachedUser.wrappedAge, company: CachedUser.wrappedCompany, email: CachedUser.wrappedEmail, address: CachedUser.wrappedAddress, about: CachedUser.wrappedAbout, registered: CachedUser.wrappedRegisterDate, tags: CachedUser.wrappedTags, friends: friends)
            }
            
            users = CoreDataUsers
        }
    }
}

#Preview {
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
          let container = NSPersistentContainer(name: "UsersData")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          context.persistentStoreCoordinator = container.persistentStoreCoordinator
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
          return ContentView().environment(\.managedObjectContext, context)
}
