//
//  ViewController.swift
//  PokemonApp
//
//  Created by Jerrion Joy on 1/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var pokemonList: [PokData] = [] 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let anonymousFunction = {(pokeList: [PokemonList]) in
            self.next = pokeList
            self.reloadData
            
        }
        
        NetworkManager.shared.getData(completed: anonymousFunction)
        
        
    
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}


