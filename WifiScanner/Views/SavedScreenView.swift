//
//  SavedScreenView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 2.08.2023.
//
import SwiftUI


struct SavedScreenView: View {

    @StateObject var viewModel = SavedScreenViewModel()

    var body: some View {
        ScrollView {
            VStack() {
                ForEach(0..<viewModel.networkInfoModels.count, id: \.self) { index in
                    VStack(spacing: 20) {
                        Text("IP: \(viewModel.networkInfoModels[index].ipAddress)")
                            .bold()
                        HStack {
                            Text("SSID: \(viewModel.networkInfoModels[index].ssID ?? "No value")")
                                .foregroundColor(.green)
                                .bold()
                            Spacer()
                            Text("BSSID:\(viewModel.networkInfoModels[index].bssID ?? "No value")")
                                .foregroundColor(.blue)
                                .bold()
                        }
                    } .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding(.horizontal)
                        .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .padding(.horizontal)
                }
            }
        }.navigationTitle("Saved Informations")

            
            .onAppear {
            viewModel.fetchOldInfos()
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.deleteAll()
                } label: {
                    Image(systemName: "trash")
                }
            }
        })

    }
}


struct SavedScreenView_Preview: PreviewProvider {
    static var previews: some View {
        SavedScreenView()
    }
}
