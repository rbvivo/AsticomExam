//
//  APIResponse.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

enum APIResponse<T> {
    case success(T)
    case failure(Error)
}

