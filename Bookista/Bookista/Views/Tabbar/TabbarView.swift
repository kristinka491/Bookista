//
//  TabbarView.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-15.
//

import SwiftUI

struct TabbarView: View {
    @StateObject var viewModel = TabBarViewModel()
    @State var selectedTab: Int = TabItem.home.rawValue
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(viewModel.pages) { item in
                    AnyView(_fromValue: item.page
                                        .environmentObject(viewModel))
                        .tabItem {
                            EmptyView()
                        }
                        .tag(item.rawValue)
                }
            }
            
            if !viewModel.isHiddenTabBar {
                HStack {
                    ForEach(Array(viewModel.pages.enumerated()), id: \.element) { index, item in
                        TabButton(selectedTab: $selectedTab, tab: item)
                    }
                }
                .frame(height: 53)
                .padding(.horizontal, 20)
            }
        }
        .toolbar(.hidden)
    }
}

private struct TabButton: View {
    @Binding var selectedTab: Int
    @State private var showText: Int = 0
    @State private var selectedOffset: CGFloat = 0
    @State private var rotationAngle: CGFloat = 0
    @Namespace var namespace

    let tab: TabItem

    var body: some View {
        Button {
            withAnimation(.easeOut) {
                selectedTab = tab.rawValue
            }

            selectedOffset = -60
            if tab.rawValue < selectedTab {
                rotationAngle += 360
            } else {
                rotationAngle -= 360
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                selectedOffset = 0
                if tab.rawValue < selectedTab {
                    rotationAngle += 720
                } else {
                    rotationAngle -= 720
                }
            }
        } label: {
            ZStack {
                if isSelected {
                    Capsule()
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                }
                HStack(spacing: 10) {
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? tab.color : .getStartedViewTextColor)
                        .rotationEffect(.degrees(rotationAngle))
                        .scaleEffect(isSelected ? 1 : 0.9)
                        .animation(.easeInOut, value: rotationAngle)
                        .opacity(isSelected ? 1 : 0.7)
                        .padding(.leading, isSelected ? 20 : 0)
                        .padding(.horizontal, selectedTab != tab.rawValue ? 10 : 0)
                        .offset(y: selectedOffset)
                        .animation(.default, value: selectedOffset)

                    if isSelected {
                        Text(tab.tag)
                            .font(.roboto(.regular, size: 15))
                            .foregroundColor(tab.color)
                            .opacity(isSelected ? 1 : 0)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.vertical, 10)
            }
        }
        .buttonStyle(.plain)
    }

    private var isSelected: Bool {
        selectedTab == tab.rawValue
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(TabBarViewModel())
    }
}
