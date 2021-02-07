//
//  MovieDetailWireFrameData.swift
//  PopCornFlix
//
//  Created by Burak Nurçiçek on 7.02.2021.
//

import Foundation

public class MovieDetailWireFrameData: WireframeDataProtocol {
  
    private(set) var id: Int

    public init(id: Int) {
        self.id = id
    }
}

