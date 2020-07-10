//
//  DetailMovieVC.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class DetailMovieVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var discover: Discover?
    var networkRequest: DetailMovieRequest?
    var detailMovie: DetailMovieRawResponse?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavigationBar(with: discover?.originalTitle ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showLoadingView()
        self.networkRequest?.getDetail(movieID: discover?.id ?? 0)
    }
    
    func setupUI(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "DetailMovieTableCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CELL_DETAIL_MOVIE")
    }

}

//MARK:- Response FROM API
extension DetailMovieVC: DetailMovieResponse {
    override func awakeFromNib() {
        config(vc: self)
    }
    
    func config(vc: DetailMovieVC){
        var present = DetailMoviePresent()
        present.output = vc
        self.networkRequest = present
    }
    
    func resultGetDetail(success: Bool, object: DetailMovieRawResponse) {
        self.setupUI()
        self.hideLoadingView()
        self.detailMovie = object
        self.tableView.reloadData()
    }
    
    func errorGetDetail(success: Bool, object: ErrorRawResponse) {
        self.hideLoadingView()
        self.showAlert(message: object.message)
    }
}

//MARK:- UITableViewDataSource
extension DetailMovieVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_DETAIL_MOVIE", for: indexPath) as! DetailMovieTableCell
        cell.setupData(detailMovie)
        return cell
    }
    
    
}

//MARK:- UITableViewDelegate
extension DetailMovieVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
