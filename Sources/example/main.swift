import YogaSwift

class View: YogaLayoutProtocol {
    let yogaNode: YogaNode
    init() {
        yogaNode = YogaNode(enableExperimental: nil)
    }
}

let view = View()

view.layout()
    .direction(.leftToRight)
    .flexGrow(1)
    .padding(.horizontal(10~))
    .border(.all(100%))
