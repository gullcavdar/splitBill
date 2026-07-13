//
//  ContentView.swift
//  SplitBill
//
//  Created by Gül Çavdar on 13.07.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    let tipOptions: [Double] = [0, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(spacing: 8) {
                            Image("money")
                                .resizable()
                                .frame(width: 28, height: 28)
                            
                            Text("Hesap Detayları")
                                .font(.custom(FontBook.PoppinsRegular.rawValue, size: 15))
                                .foregroundColor(Colors.navTitle)
                        }
                        
                        HStack {
                            Image("grayMoney")
                                .resizable()
                                .frame(width: 28
                                       , height: 28)
                            
                            TextField("", text: $viewModel.totalAmount, prompt: Text("Toplam Hesap").foregroundColor(Colors.gray))
                                .keyboardType(.decimalPad)
                                .font(.custom(FontBook.PoppinsRegular.rawValue, size: 14))
                                .foregroundColor(Colors.navTitle)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                        
                        Divider()
                            .padding(.vertical, 4)
                        
                        
                        HStack(spacing: 8) {
                            Image("percent")
                                .resizable()
                                .frame(width: 28, height: 28)
                            
                            Text("Bahşiş Yüzdesi")
                                .font(.custom(FontBook.PoppinsMedium.rawValue, size: 14))
                                .foregroundColor(Colors.navTitle)
                            
                            Spacer()
                            Text("\(Int(viewModel.tipPercentage))%")
                                .font(.custom(FontBook.PoppinsBold.rawValue, size: 13))
                                .foregroundColor(Colors.blue)
                        }
                        
                        HStack {
                            ForEach(tipOptions, id: \.self) { tip in
                                Button(action: {
                                    viewModel.tipPercentage = tip
                                }) {
                                    Text("\(Int(tip))%")
                                        .font(.custom(FontBook.PoppinsMedium.rawValue, size: 14))
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 10)
                                        .background(viewModel.tipPercentage == tip ? Colors.blue : Colors.lightGray)
                                        .foregroundColor(viewModel.tipPercentage == tip ? .white : Colors.gray)
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        Slider(value: $viewModel.tipPercentage, in: 0...30, step: 1)
                            .tint(Colors.blue)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack(spacing: 8) {
                            Image("person")
                                .resizable()
                                .frame(width: 28, height: 28)
                            
                            Text("Kişi Sayısı")
                                .font(.custom(FontBook.PoppinsMedium.rawValue, size: 14))
                                .foregroundColor(Colors.navTitle)
                        }
                        
                        HStack {
                            Image("grayPerson")
                                .resizable()
                                .frame(width: 32, height: 32)
                    
                            TextField("", text: $viewModel.personCount, prompt: Text("Kişi Sayısı").foregroundColor(Colors.gray))
                                .keyboardType(.numberPad)
                                .font(.custom(FontBook.PoppinsMedium.rawValue, size: 14))
                                .foregroundColor(Colors.navTitle)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.04), radius: 10, x: 0, y: 4)
                    
                    Button(action: {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        viewModel.calculate()
                    }) {
                        Text("HESAPLA")
                            .font(.custom(FontBook.PoppinsBold.rawValue, size: 16))
                            .foregroundColor(.white)
                            .tracking(2.0)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Colors.blue)
                            .cornerRadius(16)
                    }
                    .padding(.top, 8)
                    
                    if let errorMessage = viewModel.errorMessage {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                            Text(errorMessage)
                                .font(.custom(FontBook.PoppinsMedium.rawValue, size: 14))
                        }
                        .foregroundColor(.red)
                        .padding()
                        
                    } else if viewModel.resultPerPerson > 0 {
                        VStack(spacing: 8) {
                            Text("KİŞİ BAŞI DÜŞEN")
                                .font(.custom(FontBook.PoppinsMedium.rawValue, size: 14))
                                .foregroundColor(Colors.gray)
                                .kerning(1.2)
                            
                            Text(String(format: "₺%.2f", viewModel.resultPerPerson))
                                .font(.custom(FontBook.PoppinsBold.rawValue, size: 28))
                                .foregroundColor(Colors.blue)
                        }
                        .padding(.top, 16)
                        
                    } else {
                        Text("Bilgileri doldurun ve hesapla'ya basın")
                            .font(.custom(FontBook.PoppinsRegular.rawValue, size: 12))
                            .foregroundColor(Colors.softGray)
                    }
                }
                .padding()
            }
            .background(Colors.bgColor.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("SPLİT BİLL")
                            .font(.custom(FontBook.PoppinsBold.rawValue, size: 22))
                            .foregroundColor(Colors.navTitle)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
