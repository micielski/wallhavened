use json::WallhavenSettings;
use reqwest::Client;

mod json;

struct WallhavenUser {
    api_key: String,
    client: Client,
}

impl WallhavenUser {
    pub fn new(api_key: String) -> Result<Self, Box<dyn std::error::Error>> {
        let client = Self::create_client(api_key.clone());
        // TODO: check api key for correctness
        Ok(WallhavenUser { api_key, client })
    }

    pub fn settings(&self) -> WallhavenSettings {
        todo!()
    }

    fn create_client(api_key: String) -> Client {
        todo!()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn creating_wallhaven_user() {
        let _user = WallhavenUser::new("erwiopjweoir".to_owned());
    }
}
