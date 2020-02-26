//
//  ViewController.swift
//  ProgrammaticSearchBar
//
//  Created by ramil on 26.02.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @objc func handleShowSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search Bar"
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        showSearchBarButton(shouldShow: true)
    }
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }

}

extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar did begin editing...")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bad did end editing...")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text is \(searchText)")
    }
}
