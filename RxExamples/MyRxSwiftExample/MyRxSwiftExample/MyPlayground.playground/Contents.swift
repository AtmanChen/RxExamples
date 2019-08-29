import UIKit
import RxSwift
import RxCocoa

var count = 0
let disposeBag = DisposeBag()


// MARK: create
let create = Observable<Int>.create { observer -> Disposable in
    observer.onNext(1)
    return Disposables.create()
}

// MARK: of
let of = Observable.of(1, 2, 3)
of.subscribe(onNext: {
    print($0)
})
.disposed(by: disposeBag)

let ofArr = Observable.of([1, 2, 3])
let ofArrSubscription = ofArr.subscribe(onNext: {
    print($0)
})

ofArrSubscription.disposed(by: disposeBag)


// MARK: from
let from = Observable.from([1, 2, 3])
from.subscribe(onNext: {
    print($0)
})
.disposed(by: disposeBag)
