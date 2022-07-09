import Foundation

struct Result: Decodable {
    var type: String?
    var api_path: String?
    var artist_names: String?
    var full_title: String?
    var title: String?
    var name: String?
    var header_image_thumbnail_url: String?
    var header_image_url: String?
    var id: Int?
    var lyrics_owner_id: Int?
    var lyrics_state: String?
    var lyrics_updated_at: Int?
    var release_date_for_display: String?
    var cover_art_thumbnail_url: String?
    var song_art_image_thumbnail_url: String?
    var song_art_image_url: String?
    var title_with_featured: String?
}

//"_type":"song"
//"annotation_count":19
//"api_path":"/songs/2942139"
//"artist_names":"Post Malone (Ft. 21 Savage)"
//"full_title":"​​rockstar by Post Malone (Ft. 21 Savage)"
//"header_image_thumbnail_url":"https://images.genius.com/87a4ba40b84e33af2475f336420d0c19.300x300x1.png"
//"header_image_url":"https://images.genius.com/87a4ba40b84e33af2475f336420d0c19.1000x1000x1.png"
//"id":2942139
//"instrumental":false
//"lyrics_owner_id":104344
//"lyrics_state":"complete"
//"lyrics_updated_at":1655159093
//"path":"/Post-malone-rockstar-lyrics"
//"pyongs_count":767
//"relationships_index_url":"https://genius.com/Post-malone-rockstar-sample"
//"release_date_components":{...}3 items
//"release_date_for_display":"September 15, 2017"
//"song_art_image_thumbnail_url":"https://images.genius.com/fcea8961b4c35793ce051a4637990615.300x300x1.png"
//"song_art_image_url":"https://images.genius.com/fcea8961b4c35793ce051a4637990615.1000x1000x1.png"
//"stats":{...}3 items
//"title":"​​rockstar"
//"title_with_featured":"​​rockstar (Ft. 21 Savage)"
//"updated_by_human_at":1655159093
//"url":"https://genius.com/Post-malone-rockstar-lyrics"
