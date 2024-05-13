//
//  Movie.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 28/4/2567 BE.
//

import Foundation
import UIKit

enum Genre: String, Codable {
  case Action
  case Comedy
  case Drama
  case Fantasy
  case Horror
  case Romance
  case Thriller
  case Crime
  case SciFi = "Sci-Fi"

}

enum ContentRating: String, Codable {
  case PG
  case PG13 = "PG-13"
  case R
}
//อันนี้มีแก้

struct Banner {
    var image: String
    var title: String
}

struct Movie: Codable {
  var imageName: String
  var title: String
  var synopsis: String
  var screeningDate: [Date]
  var duration: Int
  var genres: [Genre]
  var contentRating: ContentRating
  var director: String
  var cast: [String]
    //อันนี้มีแก้

  init(
    image imageAssetName: String,
    title: String,
    filmReview: String,
    screeningDates: [Date],
    duration: Int,
    genres: [Genre],
    contentRating: ContentRating,
    director: String,
    cast: [String]
  ) {
      //อันนี้มีแก้

    //        self.image = UIImage(named: imageAssetName) ?? UIImage(systemName: "photo")!
    self.imageName = imageAssetName
    self.title = title
    self.synopsis = filmReview
    self.screeningDate = screeningDates
    self.duration = duration
    self.genres = genres
    self.contentRating = contentRating
    self.director = director
    self.cast = cast
  }
    //อันนี้มีแก้

    func isIdentical(_ other: Movie) -> Bool {
        return title == other.title &&
               director == other.director &&
               screeningDate.elementsEqual(other.screeningDate)
    }

    // แก้hourStr
  func durationString() -> String {
    let hour: Int = Int(floor(Double(duration) / 60))
    let minute: Int = duration - hour * 60
    let hourStr = hour > 1 ? "Hours" : "Hour"
    return "\(hour) \(hourStr) \(minute > 0 ? "\(minute) Minutes" : "")"
  }
    //อันนี้มีแก้

    func releaseDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return screeningDate.map { formatter.string(from: $0) }.joined(separator: ", ")
    }
  //เห็นหนังเรามีgenreไม่เกิน3อยู่แล้วเลยแก้ให้convertจากarrayเป็นstringเฉยๆ
  func genresString() -> String {
    var Genres: [String] = []
    for i in 0..<genres.count {
      Genres.append(genres[i].rawValue)
    }
    return Genres.joined(separator: ", ")
  }
  
    func castList() -> NSAttributedString {
            let castString = NSAttributedString(
                string: "Cast: ",
                attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]
            )
            let list = NSAttributedString(
                string: cast.joined(separator: ", "),
                attributes: [.font: UIFont.systemFont(ofSize: 17)]
            )
            let castList = NSMutableAttributedString()
            castList.append(castString)
            castList.append(list)
            return castList
        }
}


extension String {
  
  func loadImageString() -> UIImage? {
    UIImage(named: self)
  }
  
}

//สร้างวันที่ให้หนังแต่ละเรื่อง
extension Movie {
    private static func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }

    private static func dateFromString(_ dateString: String) -> [Date] {
        guard let date = dateFormatter().date(from: dateString) else { return [] }
        return [date]
    }

    static func screeningDatesForPulpFiction() -> [Date] {
        return dateFromString("07/05/2024")
    }

    static func screeningDatesForTheGodfather() -> [Date] {
        return dateFromString("14/05/2024")
    }

    static func screeningDatesForBackToTheFuture() -> [Date] {
        return dateFromString("21/05/2024")
    }

    static func screeningDatesForKillBill() -> [Date] {
        return dateFromString("28/05/2024")
    }

    static func screeningDatesForJaws() -> [Date] {
        return dateFromString("04/06/2024")
    }

    static func screeningDatesForForrestGump() -> [Date] {
        return dateFromString("11/06/2024")
    }

    static func screeningDatesForShawShankRedemption() -> [Date] {
        return dateFromString("18/06/2024")
    }

    static func screeningDatesForTheMatrix() -> [Date] {
        return dateFromString("25/06/2024")
    }
}

