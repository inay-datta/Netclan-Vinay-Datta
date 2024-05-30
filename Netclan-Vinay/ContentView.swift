import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let distance: Double
    let profileScore: Int
    let interests: [String]
    let bio: String
    let imageName: String
}

struct ContentView: View {
    @State private var selectedButtonIndex: Int = 0
    
    @State private var searchText = ""
    
    @State private var showRefinePage = false
    
    let darkSeafoam = Color(red: 15 / 255, green: 60 / 255, blue: 84 / 255, opacity: 1.0)
    //rgba(15,60,84,255)
    
    let cards: [Card] = [
        Card(name: "Abhishek Verma",
             location: "Bangalore | UI and UX Designer",
             distance: 1.1,
             profileScore: 10,
             interests: ["Coffee", "Business", "Friendship"],
             bio: "Hi community! I am open to new connections 😊\nI'm a UI/UX Designer with over 1.5 years of experience. I'm passionate about designing digital products that are user friendly and visually aesthetic.",
            imageName: "virat"),
        
        Card(name: "Ranjitha Jalagar",
             location: "Bangalore | NA",
             distance: 0.75,
             profileScore: 18,
             interests: ["Coffee", "Business", "Friendship"],
             bio: "Hi community! I am open to new connections 😊",
             imageName: "virat"),
        
        Card(name: "Pratik Soni",
             location: "Mumbai | Software Engineer",
             distance: 2.3,
             profileScore: 84,
             interests: ["Coding", "Entrepreneurship", "Reading"],
             bio: "Hi there! I'm a passionate software engineer with over 3 years of experience in building scalable and robust applications. Always eager to learn new technologies and collaborate on exciting projects.",
             imageName: "virat"),
        
        Card(name: "Isha Gupta",
             location: "Delhi | Marketing Professional",
             distance: 0.9,
             profileScore: 46,
             interests: ["Marketing", "Social Media", "Networking"],
             bio: "Hello everyone! I'm a skilled marketing professional with expertise in digital marketing and social media strategy. Looking to connect with like-minded professionals and explore new opportunities.",
             imageName: "virat")
    ]
    
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 0) {
                    
                    // Top navigation bar
                    VStack {
                        HStack {
                            Button(action: {
                                // Action for the menu button
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Howdy Vinay Datta !!")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                HStack {
                                    Image(systemName: "location")
                                        .foregroundColor(.white)
                                    Text("Horamavu, Bengaluru")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: RefinePage()) {
                                                VStack {
                                                    Image(systemName: "slider.horizontal.3")
                                                        .font(.title)
                                                        .foregroundColor(.white)
                                                    
                                                    Text("Refine")
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            .padding()
                                            .cornerRadius(8)
                                            .padding(.horizontal)
                        }
                        .padding()
                        
                        Divider()
                            .background(Color.blue)
                        
                        HStack {
                            Button(action: {
                                self.selectedButtonIndex = 0 // Set selected button index
                            }) {
                                VStack {
                                    Text("Personal")
                                        .font(.headline)
                                        .foregroundColor(selectedButtonIndex == 0 ? .white : .gray) // Change text color based on selection
                                    Rectangle()
                                        .frame(height: 5) // Height of the rectangle
                                        .foregroundColor(selectedButtonIndex == 0 ? .white : .clear) // Change rectangle color based on selection
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            
                            Spacer()
                            
                            Button(action: {
                                self.selectedButtonIndex = 1 // Set selected button index
                            }) {
                                VStack {
                                    Text("Services")
                                        .font(.headline)
                                        .foregroundColor(selectedButtonIndex == 1 ? .white : .gray) // Change text color based on selection
                                    Rectangle()
                                        .frame(height: 5) // Height of the rectangle
                                        .foregroundColor(selectedButtonIndex == 1 ? .white : .clear) // Change rectangle color based on selection
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            
                            Spacer()
                            
                            Button(action: {
                                self.selectedButtonIndex = 2 // Set selected button index
                            }) {
                                VStack {
                                    Text("Businesses")
                                        .font(.headline)
                                        .foregroundColor(selectedButtonIndex == 2 ? .white : .gray) // Change text color based on selection
                                    Rectangle()
                                        .frame(height: 5) // Height of the rectangle
                                        .foregroundColor(selectedButtonIndex == 2 ? .white : .clear) // Change rectangle color based on selection
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                    }
                    .background(darkSeafoam)
                    .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                            .padding(.leading, 8)
                            .frame(height: 20)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .frame(width: 350)
                    
                    ScrollView {
                        VStack {
                            ForEach(cards) { card in
                                CardView(card: card)
                                    .padding(.bottom)
                            }
                        }
                        .padding()
                    }
                    
                    
                    Spacer()
                    
                    Divider()
                        .background(Color.gray)
                    
                    TabView {
                        Text("")
                            .tabItem {
                                Image(systemName: "eye")
                                Text("Explore")
                            }
                        Text("")
                            .tabItem {
                                Image(systemName: "person.2")
                                Text("Connections")
                            }
                        Text("")
                            .tabItem {
                                Image(systemName: "bubble.right")
                                Text("Chat")
                            }
                        Text("")
                            .tabItem {
                                Image(systemName: "phone.fill")
                                Text("Contacts")
                            }
                        Text("")
                            .tabItem {
                                Image(systemName: "person.3")
                                Text("Groups")
                            }
                    }
                    .frame(height: geometry.safeAreaInsets.bottom + 20)
                    .background(Color.blue)
                }
                .background(Color.white.ignoresSafeArea(edges: .all))
            }
            .accentColor(.blue)
        }
    }
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        ProfilePictureView(imageName: card.imageName)
                        Text(card.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("+INVITE")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                    
                    Text(card.location)
                        .foregroundColor(.secondary)
                    
                    Text("within \(card.distance) KM")
                        .foregroundColor(.secondary)
                    
                    HStack {
                        ProgressBar(value: card.profileScore)
                                .frame(height: 10) // Adjust the height of the progress bar as needed
                                .padding(.trailing, 8) // Add some spacing between the progress bar and other elements
                                .padding(.bottom, 5)
                        Text("Profile Score - \(card.profileScore)%")
                            .foregroundColor(.secondary)
                            .frame(width: 200)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 8) {
                        ForEach(card.interests, id: \.self) { interest in
                            Text(interest)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue.opacity(0.2))
                                .foregroundColor(.blue)
                                .cornerRadius(16)
                        }
                    }
                    
                    Text(card.bio)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                }
                .padding(.trailing)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProfilePictureView: View {
    let imageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
    
        }
    }
}

struct ProgressBar: View {
    var value: Int // Value between 0 and 100
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(width: geometry.size.width, height: 10)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: CGFloat(self.value) / 100 * geometry.size.width, height: 10)
            }
            .cornerRadius(10)
        }
    }
}



struct RefinePage: View {
    
    let darkSeafoam = Color(red: 15 / 255, green: 60 / 255, blue: 84 / 255, opacity: 1.0)
    
    @State private var text = "Hi Community ! i am open for new connections :)"
    
    @State private var sliderValue: Double = 10
    
    let purposes = ["Coffee", "Business", "Hobbies", "Friendship", "Movies", "Dining", "Dating", "Matrimony"]

        @State private var selectedPurposes = Set<String>()
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Top header
                HStack {
                    Text("Refine")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 135)
                        .background(darkSeafoam)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Select your availability")
                        .foregroundColor(darkSeafoam)
                        .font(.headline)
                        .bold()
                    
                    DropdownView()
                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .topLeading)
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Add Your Status")
                        .foregroundColor(darkSeafoam)
                        .font(.headline)
                        .bold()
                    
                    LimitedTextEditor(text: $text)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 180, alignment: .topLeading)
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Select Hyperlocal Distance")
                        .foregroundColor(darkSeafoam)
                        .font(.headline)
                        .bold()
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Slider(value: $sliderValue, in: 1...50)
                                .overlay(
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray)
                                            .frame(height: 5)
                                            .opacity(0.2)
                                            .frame(width: 250)
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(darkSeafoam)
                                            .frame(width: CGFloat(sliderValue / 50) * 250, height: 5)
                                    }
                                )
                            
                            Text("\(Int(sliderValue)) Km")
                                .font(.caption)
                                .foregroundColor(darkSeafoam)
                                .position(x: CGFloat(sliderValue / 50) * 250, y: -10)
                                .frame(width: 50)
                        }
                        .frame(height: 20)
                        .padding()
                    }
                    .frame(height: 40)
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Select Purpose")
                        .foregroundColor(darkSeafoam)
                        .font(.headline)
                        .bold()
                    
                    
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 16) {
                            ForEach(purposes, id: \.self) { purpose in
                                Button(action: {
                                    if selectedPurposes.contains(purpose) {
                                        selectedPurposes.remove(purpose)
                                    } else {
                                        selectedPurposes.insert(purpose)
                                    }
                                }) {
                                    Text(purpose)
                                        .foregroundColor(selectedPurposes.contains(purpose) ? .white : .blue)
                                        .padding()
                                        .background(selectedPurposes.contains(purpose) ? darkSeafoam : Color.white)
                                        .cornerRadius(18)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 18)
                                                .stroke(darkSeafoam, lineWidth: 1))
                                }
                            }
                        }
                    }.frame(height: 150)
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
                .padding(.horizontal)
                
                Button(action: {
                    
                }) {
                    Text("Save and Explore")
                        .foregroundColor( .white)
                        .padding()
                        .background( darkSeafoam)
                        .cornerRadius(28)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(darkSeafoam, lineWidth: 1))
                }
                
                Spacer()
                
                // Main content
                
            }
            .edgesIgnoringSafeArea(.top)
        }.accentColor(.white)
       
    }
    
}

struct LimitedTextEditor: View {
    @Binding var text: String
    private let characterLimit: Int
    
    let darkSeafoam = Color(red: 15 / 255, green: 60 / 255, blue: 84 / 255, opacity: 1.0)

    init(text: Binding<String>, characterLimit: Int = 500) {
        self._text = text
        self.characterLimit = characterLimit
    }

    var body: some View {
        VStack(alignment: .leading) {

            TextEditor(text: $text)
                .frame(height: 100)
                .padding(4)
                .foregroundColor(darkSeafoam)
                .font(.caption)
                .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(darkSeafoam, lineWidth: 1))
                .onChange(of: text) { newValue in
                    if newValue.count > characterLimit {
                        text = String(newValue.prefix(characterLimit))
                    }
                }

            Text("\(text.count)/\(characterLimit) characters")
                .font(.caption)
                .foregroundColor(text.count > characterLimit ? .red : darkSeafoam)
                .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
       
        
    }
}

struct DropdownView: View {
    
    let darkSeafoam = Color(red: 15 / 255, green: 60 / 255, blue: 84 / 255, opacity: 1.0)
    @State private var selectedOption = "Available | Hey Lets Connect"
    private let options = ["Available | Hey Lets Connect", "Busy", "In a meeting"]

    var body: some View {
        VStack(alignment: .leading) {

            Rectangle()
                .fill(Color.gray.opacity(1))
                .overlay(
                    HStack {
                        Picker("", selection: $selectedOption) {
                            ForEach(options, id: \.self) { option in
                                Text(option)
                                    .background(darkSeafoam)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .labelsHidden()
                    }
                    .padding(.horizontal)
                )
                .frame(height: 30)
                .cornerRadius(8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
        .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(darkSeafoam, lineWidth: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
