//
//  ContentView.swift
//  EmmaApp
//
//  Created by Ben Walker on 2020-01-11.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import SwiftUI

struct LanguageSelectionView: View {
	var parent: ContentView!
	@Environment(\.presentationMode) var presentationMode
    var body: some View {
		NavigationView {
				VStack {
					Picker(selection: parent.$selection, label: EmptyView()) {
						ForEach(0..<LANGUAGES.count) {
							Text(LANGUAGES[$0].name)
						}
					}.labelsHidden().padding(.top, 100)
					Spacer()
				}
				.navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {Text("Done")}))
			}
		}
}

struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionView()
    }
}
