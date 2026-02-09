//
//  CalendarView.swift
//  Fitly
//
//  Created by visortix on 09.02.2026.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var vm = CalendarViewModel.init()
    
    var body: some View {
        HStack(spacing: 16) {
            days
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(16)
        .background()
        .onAppear { vm.update() }
        // TODO: Delete
        .onAppear {
            vm.trainingDays = [.monday, .wednesday, .friday]
        }
        .onAppear {
            for familyName in UIFont.familyNames {
                print(familyName)
            }
        }
    }
}

extension CalendarView {
    var days: some View {
        ForEach(vm.daysOfWeek, id: \.rawValue) { day in
            
            Text(vm.represent(day: day))
                .font(.custom("SF Compact Rounded", fixedSize: 17))
                .foregroundStyle(vm.isTrainingDay(day: day) ? Color("FFAB0F") : .black)
        }
    }
}

#Preview {
    Color.blue
        .overlay {
            CalendarView()
        }
}
