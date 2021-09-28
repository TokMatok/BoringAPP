class ActivityNetworkService: AnyNetworkService<Activity> {
    override init() {
        super.init()
        self.endpoint = "/activity/"
    }
}
