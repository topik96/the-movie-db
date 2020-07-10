//
//  GenreVC.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import UIScrollView_InfiniteScroll

class GenreVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var networkRequest: GenreRequest?
    var genres = [Genre]()
    var tempGenres = [Genre]()
    var counterPage: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configNavigationBar(with: "Genre")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
        self.networkRequest?.getGenre()
    }
    
    func setupUI(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.showLoadingView()
        
        let nib = UINib(nibName: "GenreTableCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CELL_GENRE")
        self.tableView.addInfiniteScroll(handler: { tblView in
            self.updateGenres()
        })
    }
    
    func updateGenres(){
        self.counterPage += 5
        for index in tempGenres.count..<counterPage where genres.indices.contains(index) {
            self.tempGenres.append(Genre(id: genres[index].id, name: genres[index].name))
        }
        self.tableView.finishInfiniteScroll()
        self.tableView.reloadDataSmoothly()
    }
}

//MARK:- Response FROM API
extension GenreVC: GenreResponse {
    override func awakeFromNib() {
        config(vc: self)
    }
    
    func config(vc: GenreVC){
        var present = GenrePresent()
        present.output = vc
        self.networkRequest = present
    }
    
    func resultGetGenre(success: Bool, object: GenreRawResponse) {
        self.hideLoadingView()
        self.genres = object.genres
        self.updateGenres()
    }
    
    func errorGetGenre(success: Bool, object: ErrorRawResponse) {
        self.hideLoadingView()
        self.showAlert(message: object.message)
    }
    
}

//MARK:- UITableViewDataSource
extension GenreVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tempGenres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_GENRE", for: indexPath) as! GenreTableCell
        let genre = tempGenres[indexPath.row]
        cell.titleLabel.text = genre.name
        return cell
    }
}

//MARK:- UITableViewDelegate
extension GenreVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DiscoverWireframe.push(from: self, genre: tempGenres[indexPath.row])
    }
}
