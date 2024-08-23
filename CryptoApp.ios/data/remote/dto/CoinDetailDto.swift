import Foundation

struct CoinDetailDto: Codable {
    let id: String
    let name: String
    let symbol: String?
    let rank: Int?
    let isNew: Bool?
    let isActive: Bool?
    let type: String?
    let logo: String?
    let tags: [Tag]?
    let team: [Team]?
    let description: String?
    let message: String?
    let openSource: Bool?
    let startedAt: String?
    let developmentStatus: String?
    let hardwareWallet: Bool?
    let proofType: String?
    let orgStructure: String?
    let hashAlgorithm: String?
    let links: Links?
    let linksExtended: [LinksExtended]?
    let whitepaper: Whitepaper?
    let firstDataAt: String?
    let lastDataAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case isNew = "is_new"
        case isActive = "is_active"
        case type
        case logo
        case tags
        case team
        case description
        case message
        case openSource = "open_source"
        case startedAt = "started_at"
        case developmentStatus = "development_status"
        case hardwareWallet = "hardware_wallet"
        case proofType = "proof_type"
        case orgStructure = "org_structure"
        case hashAlgorithm = "hash_algorithm"
        case links
        case linksExtended = "links_extended"
        case whitepaper
        case firstDataAt = "first_data_at"
        case lastDataAt = "last_data_at"
    }
}

// MARK: - Links
struct Links: Codable {
    let explorer: [String]
    let facebook: [String]
    let reddit: [String]
    let sourceCode: [String]
    let website: [String]
    let youtube: [String]

    enum CodingKeys: String, CodingKey {
        case explorer
        case facebook
        case reddit
        case sourceCode = "source_code"
        case website
        case youtube
    }
}

// MARK: - LinksExtended
struct LinksExtended: Codable {
    let url: String
    let type: String
    let stats: Stats?

    enum CodingKeys: String, CodingKey {
        case url
        case type
        case stats
    }
}

// MARK: - Stats
struct Stats: Codable {
    let subscribers: Int?
    let contributors: Int?
    let stars: Int?
    let followers: Int?
}

// MARK: - Tag
struct Tag: Codable {
    let id: String
    let name: String
    let coinCounter: Int
    let icoCounter: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coinCounter = "coin_counter"
        case icoCounter = "ico_counter"
    }
}

// MARK: - Team
struct Team: Codable {
    let id: String
    let name: String
    let position: String
}

extension Team {
    func toTeamMember() -> TeamMember {
        return TeamMember(id: self.id, name: self.name, position: self.position)
    }
}

// MARK: - Whitepaper
struct Whitepaper: Codable {
    let link: String
    let thumbnail: String
}

extension CoinDetailDto {
    func toCoinDetail() -> CoinDetail {
        return CoinDetail(coinId: self.id, name: self.name, description: self.description! ?? "no des", symbol: self.symbol ?? "no symbol", rank: self.rank ?? -1, isActive: self.isActive ?? false, tags: self.tags?.map{ $0.name }, team: self.team?.map{ $0.toTeamMember()})
    }
}
