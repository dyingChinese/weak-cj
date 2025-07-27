/*
 * Copyright (c) exdragon 2025-2026. All rights reserved.
 */
package weakcj;

public class WeakSet<T> where T <: Object & Equatable<T> {
    private var set: ArrayList<WeakRef<T>> = ArrayList()
    
    public func add(value: T): Unit {
        let weakRef = WeakRef(value, CleanupPolicy.DEFERRED)
        set.add(weakRef)
    }

    public func has(value: T): Bool {
        for (ref in this.set) {
            let obj = ref.value;
            if (obj.isSome() && obj.getOrThrow() == value) {
                return true
            }
        }
        return false
    }

    public func delete(value: T): Bool {
        for (i in 0..this.set.size) {
            let ref = set[i]
            let obj = ref.value;
            if (obj.isSome() && obj.getOrThrow() == value) {
                set.remove(at: i)
                return true
            }
        }
        return false
    }

    public func clear(): Unit {
        set = ArrayList()
    }

    public func size(): Int64 {
        var count: Int64 = 0
        for (ref in this.set) {
            if (ref.value.isSome()) {
                count += 1
            }
        }
        return count
    }
}
