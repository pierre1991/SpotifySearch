//
//  SearchAlbumsTableViewController.swift
//  SpotifySearch
//
//  Created by Pierre on 2/14/17.
//  Copyright © 2017 Pierre. All rights reserved.
//

import UIKit

class SearchAlbumsTableViewController: UIViewController {

	//MARK: Properties
    var albumSearchResults: [Album] = []
    
    
    //MARK: Further UI
    var searchController: UISearchController!
    
    
    //MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        setupSearchController()
    }
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? AlbumDetailViewController
        
        if segue.identifier == "toDetailView" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            searchController.dismiss(animated: true, completion: nil)
            
            let album = albumSearchResults[indexPath.row]
            
            destinationViewController?.album = album
        }
    }
}

extension SearchAlbumsTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.delegate = self
        searchController.searchBar.keyboardAppearance = .dark
        
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        providesPresentationContextTransitionStyle = true
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text else { return }
        
    	SearchAlbumController.querySearchTerm(searchTerm: searchTerm) { (album) in
            guard let album = album else { return }
            
            self.albumSearchResults = album
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension SearchAlbumsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        
        let album = albumSearchResults[indexPath.row]
        
        cell.updateAlbumCell(album: album)
        cell.selectionStyle = .none
        
    	return cell
    }
    
}

