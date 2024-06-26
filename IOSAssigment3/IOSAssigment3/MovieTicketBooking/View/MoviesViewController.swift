//
//  VC_AllMovies.swift
//  MovieTicketBooking
//
//  Created by Natthapat Liawpairoj on 28/4/2567 BE.
//

import UIKit

enum ShowType: Int {
    case NowShowing = 0
    case Upcoming = 1
}

final class MoviesViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var showTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var moviesCV: UICollectionView!
    
    // MARK: - Variables
    
    var movies: [Movie] = []
    var upcomingMovies: [Movie] = []
    var showType: ShowType = ShowType.NowShowing

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTypeSegmentedControl.selectedSegmentIndex = showType.rawValue
        moviesCV.setup("MovieCVC", MoviesFlowLayout())
    }
        
    // MARK: - Actions
    
    @IBAction private func showTypeSegmentedControl_ValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        showType = index == 0 ? ShowType.NowShowing : ShowType.Upcoming
        moviesCV.reloadData()
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        showType == ShowType.NowShowing ? movies.count : upcomingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCVC", for: indexPath) as! MovieCVC
        let movie = showType == ShowType.NowShowing ? movies[indexPath.row] : upcomingMovies[indexPath.row]
        cell.setupCell(movie)
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = showType == ShowType.NowShowing ? movies[indexPath.row] : upcomingMovies[indexPath.row]
        let vcMovieDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailViewController
        vcMovieDetail.movie = movie
        navigationController?.pushViewController(vcMovieDetail, animated: true)
    }
}
