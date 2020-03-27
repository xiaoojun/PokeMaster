import Combine
import Foundation
import UIKit

//
//check("Empty") {
//    Empty<Int, SampleError>()
//}
//
//check("Just") {
//    Just("Hello SwiftUI")
//}
//
//
//check("Squence") {
//    Publishers.Sequence<[Int], Never>(sequence: [Int](0...3))
//}
//
//check("Array") {
//    [4, 5, 6].publisher
//}
//check("Map") {
//    [1, 2, 3].publisher.map({ $0 * 2})
//}
//
//check(" Map Just") {
//    Just(5).map({ $0 * 2})
//}
//
//let result = [Int](0...10).reduce(0, +)
//check("Reduce") {
//    [Int](0...3).publisher.reduce(0, +)
//}
//
//extension Sequence {
//    public func scan<ResultElement>(_ initValue: ResultElement, _ nextResult: (ResultElement,Element) -> ResultElement) -> [ResultElement] {
//        var result = [ResultElement]()
//        for x in self {
//            result.append(nextResult(result.last ?? initValue, x))
//        }
//        return result
//    }
//}
//let result2 = [1, 2, 3].scan(0, +)
//
//check("Scan") {
//    [1, 2, 3].publisher.scan(0, +)
//}
//
//check("CompactMap") {
//    ["1", "2", "cat", "5"].publisher.compactMap({ Int($0)})
//}
//
//check("Flat Map 1") {
//    [[1, 2, 3], ["a", "b", "c"]].publisher.flatMap({ $0.publisher})
//}
//
//check(" Flat Map 2") {
//    ["a", "b", "c"].publisher.flatMap { (letter)  in
//        [1, 2, 3].publisher.map({ "\(letter)\($0)"})
//    }
//}
//
//check("remove Dublicates") {
//    ["s", "s", "a","b"].publisher.removeDuplicates()
//}
//
//check("Fail") {
//    Fail<Int, SampleError>(error: .sampleError)
//}
//
//check("Map Error") {
//    Fail<Int, SampleError>(error: .sampleError).mapError { (_)   in
//        MyError.myError
//    }
//}
//
//
//check("Throw") {
//    ["1", "2", "Swift", "4"].publisher
//        .tryMap { (s) -> Int in
//            guard let value = Int(s) else {
//                throw MyError.myError
//            }
//            return value
//    }
//}
//
//check(" Replace Error") {
//    ["1", "2", "Swift", "4"].publisher.tryMap { (s) -> Int in
//        guard let value = Int(s) else {
//             throw MyError.myError
//        }
//        return value
//    }.replaceError(with: -1)
//}
//
//check("Catch with Just") {
//    ["1", "2", "Swift", "4"].publisher.tryMap { (s) -> Int in
//        guard let value = Int(s) else {
//             throw MyError.myError
//        }
//        return value
//    }.catch { (_ ) in
//         Just(-1)
//    }
//}
//
//check("Catch with Another Publisher") {
//    ["1", "2", "Swift", "4"].publisher.tryMap { (s) -> Int in
//        guard let value = Int(s) else {
//             throw MyError.myError
//        }
//        return value
//    }.catch { (_ ) in
//        [-1, -2, -3].publisher
//    }
//}
//
//check("Catch and Continue") {
//    ["1", "2", "Swift", "4"].publisher
//    .print("[original]")
//        .flatMap { (s) in
//        return Just(s).tryMap { (s) -> Int in
//            guard let value = Int(s) else {
//                throw MyError.myError
//            }
//            return value
//        }      .print("[TryMap]")
//        .catch { (_)  in
//            Just(-1).print("[Just]")
//            }.print("[Catch4]")
//    }
//}
//7
//
//enum MyError: Error {
//    case myError
//}
//
//check("Filter") {
//    [Int](0...3).publisher.filter({ $0 % 2 == 0
//
//    })
//}
//
//check("Contains") {
//    [Int](0...5).publisher.print("[Original]").contains(10)
//}
//
//check("timer") {
//    [1: "a", 2: "b", 3: "c"].timerPublisher
//}
//
//
//let s1 = check("Subject") { () -> PassthroughSubject<Int, Never> in
//    let subject = PassthroughSubject<Int, Never>()
//    delay(1) {
//        subject.send(1)
//        delay(1) {
//            subject.send(2)
//            delay(1) {
//                subject.send(completion: .finished)
//            }
//        }
//    }
//    return subject
//}
//
//let subject1 = PassthroughSubject<Int, Never>()
//let subject2 = PassthroughSubject<Int, Never>()
//
//check("Subject order") {
//    subject1.merge(with: subject2)
//}
//subject1.send(20)


//
//let future = check("Future") {
//    Future<(Data, URLResponse), Error> { promise in
//        loadPage(url: URL(string: "https://example.com")!) {
//            data, response, error in
//            if let data = data, let response = response {
//                promise(.success((data, response)))
//            } else {
//                promise(.failure(error!))
//            }
//        }
//    }
//}
//
//func loadPage(url: URL, handler: @escaping (Data?, URLResponse?, Error?) -> Void) {
//    print("*********************")
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//         handler(data, response, error)
//    }.resume()
//}


//var observer: NSObjectProtocol?
//let subject0 = PassthroughSubject<(), Never>()
//observer = NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main, using: { (_) in
//    subject0.send()
//})

//let subject10 = PassthroughSubject<Date, Never>()
//Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
//    subject10.send(Date())
//}
//let timer = check("Timer") {
//     subject10
//}



//struct Response: Decodable {
//    let args: Args?
//    struct Args: Decodable {
//        let foo: String
//    }
//}
//check("Url Session") {
//    URLSession.shared.dataTaskPublisher(for: URL(string: "https://example.com")!).map{ data, _ in data}.decode(type: Response.self, decoder: JSONDecoder()).compactMap{ $0}
//
//}
//print("----------------------------------")
//let publisher0 = //publisher0.sink(receiveCompletion: { (_) in
//     print("完成")
//}) { (value) in
//    print(value)
//}


//https://example.com

struct Response: Decodable {
struct Args: Decodable {
let foo: String
}
let args: Args?
}

let net = URLSession.shared
.dataTaskPublisher(
for: URL(string: "https://httpbin.org/get?foo=bar")!)
.map { data, _ in data }
.decode(type: Response.self, decoder: JSONDecoder())
    .compactMap { $0.args?.foo }
check("URL Session") {
net
}

net.sink(receiveCompletion: { (_) in
     
    
}) { (value) in
     print(value)
}
 
let timer = Timer.publish(every: 1, on: .main, in: .default)

let temp = check("Timer") {
    timer
}
//let a = timer.connect()
 
class LoadingUI {
    var isSuccess: Bool = false {
        didSet {
            print(isSuccess)
        }
    }
    var text: String = "" {
        didSet {
            print(text)
        }
    }
}


let dataTaskPublisher = URLSession.shared
.dataTaskPublisher(
for: URL(string: "https://httpbin.org/get?foo=bar")!)

let isSuccess = dataTaskPublisher.map({ data, response -> Bool in
    
    guard let httpRes = response as? HTTPURLResponse else {
        return false
    }
    return httpRes.statusCode == 200
    }).replaceError(with: false)
let latestText = dataTaskPublisher.map({data, _ in data}).decode(type: Response.self
    , decoder: JSONDecoder()).compactMap({$0.args?.foo}).replaceError(with: "")

let ui = LoadingUI()
var token1 = isSuccess.assign(to: \.isSuccess, on: ui)
var toekn2 = latestText.assign(to: \.text, on: ui)
