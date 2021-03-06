import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
                VStack(alignment: .leading) {
                    Text(verbatim: hike.name)
                        .font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                
                Spacer()

                Button(action: {
                    withAnimation() {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(.none)//拦截动画
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        .animation(.spring())
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    //.asymmetric可以将进入进出动画分离各自设置
                    //.combined丰富动画内容
                    //AnyTransition表面显示多种动画
                    .transition(.moveAndFade)
            }
        }
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition{
        
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(
            insertion: insertion,
            removal: removal
        )
    }
}


struct HikeDetail: View {
    let hike: Hike
    @State private var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("海拔", \Hike.Observation.elevation),
        ("心率", \Hike.Observation.heartRate),
        ("步伐", \Hike.Observation.pace),
    ]
    
    var body: some View {
        return VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200, alignment: .center)
            
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button(action: {
                        self.dataToShow = value.1
                    }) {
                        Text(verbatim: value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == self.dataToShow
                                ? Color.gray
                                : Color.accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}


#if DEBUG
struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikes[0])
                .padding()
            Spacer()
        }
    }
}
#endif
