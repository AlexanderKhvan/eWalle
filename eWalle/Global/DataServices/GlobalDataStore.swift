//
//  GlovalDataStore.swift
//  eWalle
//
//  Created by Alexander Khvan on 19.07.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

class GlobalDataStore {
    var profile: ProfileModel? = ProfileModel(avatar: "person",
                                              fullName: "Carol Black",
                                              location: "USA, Washington",
                                              balance: 20600)
}
