import Basic
import Foundation
import TuistCore

@testable import TuistCoreTesting
@testable import TuistKit

final class MockProjectEditorMapper: ProjectEditorMapping {
    var mapStub: (Project, Graph)?
    var mapArgs: [(tuistPath: AbsolutePath, sourceRootPath: AbsolutePath, manifests: [AbsolutePath], helpers: [AbsolutePath], projectDescriptionPath: AbsolutePath)] = []

    func map(tuistPath: AbsolutePath,
             sourceRootPath: AbsolutePath,
             manifests: [AbsolutePath],
             helpers: [AbsolutePath],
             projectDescriptionPath: AbsolutePath) -> (Project, Graph) {
        mapArgs.append((tuistPath: tuistPath,
                        sourceRootPath: sourceRootPath,
                        manifests: manifests,
                        helpers: helpers,
                        projectDescriptionPath: projectDescriptionPath))
        if let mapStub = mapStub { return mapStub }
        return (Project.test(), Graph.test())
    }
}
