struct WallhavenUser {
    api_key: String,
}

impl WallhavenUser {
    fn new(api_key: String) -> Self {
        WallhavenUser { api_key }
    }
}
