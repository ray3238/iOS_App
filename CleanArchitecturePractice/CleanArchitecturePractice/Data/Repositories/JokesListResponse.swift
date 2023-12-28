import Foundation

struct JokesListResponse: Codable {
    let jokesList: [JokesResponse]
}

struct JokesResponse: Codable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}

extension JokesListResponse {
    func toDomain() -> [JokesListEntities] {
        self.jokesList.map {
            JokesListEntities(
                type: $0.type,
                question: $0.setup,
                answer: $0.punchline,
                id: $0.id
            )
        }
    }
}


//{
//    "type": "general",
//    "setup": "How do you know if there’s an elephant under your bed?",
//    "punchline": "Your head hits the ceiling!",
//    "id": 127
//},
