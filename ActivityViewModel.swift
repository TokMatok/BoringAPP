struct ActivityViewModel {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let color = CustomLabelStyle.allCases.randomElement()!.color
}
