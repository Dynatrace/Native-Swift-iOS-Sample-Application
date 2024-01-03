//
//  AutoInstrumentedControls.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 26.03.23.
//

import SwiftUI
import Dynatrace

struct suiAutoInstrumentedControls: View {
    
      //https://www.dynatrace.com/support/help/shortlink/swiftui-instrumentation#supported-controls
    
    @State var showAlert = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    @State private var vibrateOnRing = false
    
    @State private var value = 0
       let colors: [Color] = [.orange, .red, .gray, .blue,
                              .green, .purple, .pink]

       func incrementStep() {
           value += 1
           if value >= colors.count { value = 0 }
       }

       func decrementStep() {
           value -= 1
           if value < 0 { value = colors.count - 1 }
       }
    
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }
    
    @State private var speed = 50.0
    @State private var isEditing = false

    @State private var selectedFlavor: Flavor = .chocolate
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Buttons")){
                    Button(action: {
                        
                    }) {
                        Text("Some buttons")
                        
                    }
                    Button("Mask Action", action: {
                        
                        self.showAlert = true
                        self.alertTitle = "Note"
                        self.alertMessage = "For masking actions and all other options same Config Keys applies."
                    })    .alert(isPresented: $showAlert, content: {
                         
                        Alert(
                            title: Text(self.alertTitle),
                            message: Text(self.alertMessage),
                            primaryButton: Alert.Button.default(Text("Got it!"), action: {
                                }),
                                secondaryButton: Alert.Button.cancel(Text("View more"), action: {
                                    UIApplication.shared.open(URL(string: "https://www.dynatrace.com/support/help/shortlink/ios-configuration-keys")!)
                                }) 
                        )
                    })
                    
                }
            
                Section(header: Text("Picker")){
                    List {
                        Picker("Flavor", selection: $selectedFlavor) {
                            Text("Chocolate").tag(Flavor.chocolate)
                            Text("Vanilla").tag(Flavor.vanilla)
                            Text("Strawberry").tag(Flavor.strawberry)
                        }
                  
                    }
                }
                Section(header: Text("Stepper")){
                    Stepper {
                        Text("Value: \(value) Color: \(colors[value].description)")
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                    .padding(5)
                }
                Section(header: Text("Toggle")){
                    Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
                }
                
                Section(header: Text("Slider")){
                    Slider(
                        value: $speed,
                        in: 0...100,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    Text("\(speed)")
                }
                Section(header: Text("More information")){
                    Link("Visit SwuftUI documentation", destination: URL(string: "https://www.dynatrace.com/support/help/shortlink/swiftui-instrumentation" )!)

                }
            }
 
        }
        
    }
}

struct suiAutoInstrumentedControls_Previews: PreviewProvider {
    static var previews: some View {
        suiAutoInstrumentedControls()
    }
}
