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
    .flexGrow(10%)
    .padding(.horizontal(10))
