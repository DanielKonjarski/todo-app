//
//  ContentView.swift
//  TodoApp
//
//  Created by Daniel Konjarski on 2025-03-16.
//

import SwiftUI

struct ContentView: View{
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var taskViewModel = TaskViewModel()
    
    var body: some View{
        NavigationView{
            if userViewModel.isAuthenticated{
                DashboardView()
            }else {
                WelcomeView()
            }
        }
        .environmentObject(userViewModel)
        .environmentObject(taskViewModel)
    }
}
