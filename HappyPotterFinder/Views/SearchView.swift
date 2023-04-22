//
//  SearchView.swift
//  CharacterFinder
//
//  Created by Alistair Fraser on 2023-04-22.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: Stored properties
    //Holds the list of characters returned by our search
    @State var foundCharacters: [Character] = []
    
    //MARK: Computed properties
    var body: some View {
        List(foundCharacters, id: \.id) { currentCharacter in
            VStack {
                
                Image(currentCharacter.name)
                    .bold()
                
                Text(currentCharacter.house)
                    .bold()
            }
        }
        .task {
            //When the view appears, fetch search results for "Arrabiata"
            foundCharacters = await NetworkService.fetch()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
