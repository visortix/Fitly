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
            vm.calendar.trainingDays = [.monday, .wednesday, .friday]
        }
    }
}

extension CalendarView {
    var days: some View {
        ForEach(vm.calendar.daysOfWeek, id: \.rawValue) { day in
            
            let color = vm.isTrainingDay(day: day) ? ColorPalette.training : .black
            
            Text(vm.represent(day: day))
                .font(.custom("SF Compact Rounded", fixedSize: 17))
                .foregroundStyle(color)
                .background {
                    if vm.isFirstCalendarDay(day: day) {
                        wave(color: color)
                    }
                }
        }
    }
    
    func wave(color: Color) -> some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            
            WaveView(pixelsPerWave: 5, color: color, lineWidth: 1.2)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: height * 0.25)
        }
    }
}

#Preview {
    Color.blue
        .overlay {
            CalendarView()
        }
}
