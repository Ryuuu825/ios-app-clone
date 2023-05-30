//
//  SelectedServicePage.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI
import PhotosUI
import Photos
import AVFoundation


struct SelectedServicePage: View {
    var title : String
    
    
    @State var name : String = ""
    
    @State var imageSelection : PhotosPickerItem?
    @State private var selectedImageData: Data? = nil
    
    @State var imageSelection2 : PhotosPickerItem?
    @State private var selectedImageData2: Data? = nil

    @State private var shouldOpenRecordingSheet = false
    
    @State private var audioRecorder : AVAudioRecorder?
    @State private var isRecording : Bool = false
    
    @State private var timer : Timer?
    @State private var recordingTime : TimeInterval = 0.0
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1 , repeats: true) { timer in
            recordingTime = audioRecorder!.currentTime
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
   
    
    var body: some View {
        MyNavigationView(title: title , isRoot:  false , bgColor: .secondarySystemBackground ) {
            GeometryReader { proxy in
                ScrollView {
                    FormGroup {
                        HStack {
                            Text("** 24小時專業電力服務，安裝或維修電制、電燈、電線、電箱、電錶等")
                                .foregroundColor(.secondaryLabel)
                                .font(.callout)
                            
                            Button {} label : {
                                Text("査看詳情")
                            }
                            
                            .padding(.horizontal , 10)
                            .padding(.vertical , 10)
                            .border(Color.orange)
                            .foregroundColor(Color.orange)
                        }
                    }
                    
                    FormGroup {
                        HStack {
                            
                            LabeledContent {
                                TextField("稱呼" , text: $name )
                            } label: {
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 30)
                                        .foregroundColor(.gray.opacity(0.4))
                                }
                                .frame(width: 50 )
                            }
                        }
                        
                        
                        HStack {
                            
                            LabeledContent {
                                TextField("聯絡號碼（僅供3-5位已報價師傅杳閱)" , text: $name )
                            } label: {
                                HStack {
                                    Image(systemName: "phone.fill")
                                        .scaleEffect(x: -1 )
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 30)
                                        .foregroundColor(.gray.opacity(0.4))
                                }.frame(width: 50 )
                            }
                        }
                        
                        HStack {
                            
                            LabeledContent {
                                TextField("請潠擇地區" , text: $name )
                            } label: {
                                HStack {
                                    Image(systemName: "location.fill")
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 30)
                                        .foregroundColor(.gray.opacity(0.4))
                                }.frame(width: 50 )
                            }
                        }
                        
                        HStack {
                            
                            LabeledContent {
                                TextField("屋苑／大廈（請勿輸入單位號碼）" , text: $name )
                            } label: {
                                HStack {
                                    Image(systemName: "building.fill")
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 30)
                                        .foregroundColor(.gray.opacity(0.4))
                                }.frame(width: 50 )
                            }
                        }
                    }
                    
                    FormGroup {
                        HStack {
                            
                            LabeledContent {
                                TextField("預算金額或價錢另議" , text: $name )
                            } label: {
                                HStack {
                                    Image(systemName: "dollarsign")
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 30)
                                        .foregroundColor(.gray.opacity(0.4))
                                }.frame(width: 50 )
                            }
                        }
                        
                        HStack {
                            
                            LabeledContent {
                                
                                TextField("可輸入服務時間、服務內容、是否需要指定牌照，以助師傅了解。" , text: $name )
                                    .padding(.leading , 5)
                                    .frame(height: 150)
                                    .multilineTextAlignment(.leading)
                                
                                
                                
                                
                            } label: {
                                HStack {
                                    Image(systemName: "wrench.adjustable")
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 130)
                                        .foregroundColor(.gray.opacity(0.4))
                                    
                                }.frame(width: 45 )
                            }
                        }
                        
                        HStack {
                            
                            LabeledContent {
                                Toggle(isOn: .constant(true)) {
                                    Text("緊急")
                                        .foregroundColor(.secondaryLabel)
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .padding(8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: 1 , height: 30)
                                        .foregroundColor(.gray.opacity(0.4))
                                }.frame(width: 50 )
                            }
                        }
                        
                    }
                    
                    
                    FormGroup {
                        VStack(alignment: .leading , spacing: 5 ) {
                            "** 所有師傅皆經過身份核實。在柯打記錄內可瀏覽接洽的師傅資料、技能證明及評語。"
                            "** 柯打詳情及收費，請與師傅商議，包括査問會否收取檢査費。"
                            "** 請留意核實聯絡師傅資料是否相符。"
                            "** 柯打張貼期限為72小時，如沒有師傅報價會顯示為過期。"
                        }
                        .font(.footnote)
                        .padding(12)
                        .foregroundColor(Color(red: 0.8588612676, green: 0.611749351, blue: 0.5647186637))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                                .foregroundColor(Color(red: 0.8588612676, green: 0.611749351, blue: 0.5647186637))
                        )
                        .padding(6)
                        
                        
                        
                        
                        Button {} label: {
                            Text("送出柯打")
                                .foregroundColor(.white)
                                .frame(width: proxy.size.width * 0.85 , height: 50)
                                .background(Color(red: 0.2979485989, green: 0.5509883404, blue: 0.305899322))
                                .clipped()
                                .cornerRadius(5)
                        }
                        .frame(maxWidth: .infinity , alignment: .center)
                        
                        
                    }
                    
                    FormGroup {
                        HStack {
                            
                            PhotosPicker(selection: $imageSelection , matching: .images) {
                                if let selectedImageData , let uiImage = UIImage(data: selectedImageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .padding(6)
                                        .frame(width: 55 , height: 50)
                                    
                                } else {
                                    Image(systemName: "photo" )
                                        .resizable()
                                        .padding(6)
                                        .frame(width: 55 , height: 50)
                                        
                                }
                                
                            }
                            .onChange(of: imageSelection) { newValue in
                                
                                Task {
                                    if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                        selectedImageData = data
                                    }
                                }
                                
                            }
                            
                            ForEach(0..<2) { _ in
                                PhotosPicker(selection: $imageSelection2 , matching: .images) {
                                    if let selectedImageData , let uiImage = UIImage(data: selectedImageData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .padding(6)
                                            .frame(width: 55 , height: 50)
                                        
                                    } else {
                                        Image(systemName: "photo" )
                                            .resizable()
                                            .padding(6)
                                            .frame(width: 55 , height: 50)
                                            
                                    }
                                    
                                }
                                .onChange(of: imageSelection2) { newValue in
                                    
                                    Task {
                                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                            selectedImageData2 = data
                                        }
                                    }
                                    
                                }
                            }
                            
                            
                            Spacer()
                            
                            
                            Button {
                                shouldOpenRecordingSheet = true
                            } label: {
                                Image(systemName: "mic.fill")
                                    .resizable()
                                    .frame(width: 23 , height: 31)
                                    .padding(6)
                            }
                            .border(.white)
                            .padding(6)
                        }
                       
                        .frame(maxWidth: .infinity , alignment: .center)
                    }
                    
                    
                    
                }
            }

        }
        .sheet( isPresented: $shouldOpenRecordingSheet) {
            VStack {
                
                Text( String(format: "%0.f sec" ,  recordingTime ) )
            
                Button {
                    if (isRecording) {
                        audioRecorder?.stop()
                        stopTimer()
                        
                    } else {
                    
                        startTimer()
                        audioRecorder?.prepareToRecord()
                        audioRecorder?.record()
                       
               
                    }
                    
                    isRecording = !isRecording
                } label: {
                    Image(systemName: !isRecording ? "record.circle" : "stop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 60 , maxHeight: 60)
                        .foregroundColor(.red)
                }
 
            }
            .presentationDetents([.height(150)])
            .onAppear {
                let settings = [
                    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                    AVSampleRateKey: 12000,
                    AVNumberOfChannelsKey: 1,
                    AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                ]

                let filepath = FileManager.default.urls(for: .documentDirectory , in: .userDomainMask )[0].appendingPathComponent(UUID().description + ".m4a" )
                
                do {
                    audioRecorder = try AVAudioRecorder(url: filepath , settings: settings )
                } catch {
                    print("Error when creating recorder")
                }
            }
            .preferredColorScheme(.light)
        }
    }
    
    
    @ViewBuilder func FormGroup( @ViewBuilder content : () -> some View ) -> some View {
        VStack {
            content()
        }
        .padding(.horizontal , 12)
        .padding(.vertical , 6)
        .background(Color.white)
        .padding(.horizontal , 12)
    }
}

struct SelectedServicePage_Previews: PreviewProvider {
    static var previews: some View {
        SelectedServicePage(
            title: "電力電燈"
        )
    }
}
