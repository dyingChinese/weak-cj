/*
 * Copyright (c) exdragon 2025-2026. All rights reserved.
 */
package weakcj;

public class WeakMap<K, V> where K <: Object & Equatable<K> {
    private var map: ArrayList<(WeakRef<K>, V)> = ArrayList()

    public func set(key: K, value: V): Unit {
        delete(key)
        map.add((WeakRef(key, CleanupPolicy.DEFERRED), value))
    }

    public func get(key: K): ?V {
        for (entry in map) {
            let ref = entry[0]
            let obj = ref.value;
            if (obj.isSome() && obj.getOrThrow() == key) {
                return Some(entry[1])
            }
        }
        return None
    }

    public func has(key: K): Bool {
        for (entry in map) {
            let ref = entry[0]
            let obj = ref.value
            if (obj.isSome() && obj.getOrThrow() == key) {
                return true
            }
        }
        return false
    }

    public func delete(key: K): Bool {
        for (i in 0..map.size : -1) {
            let entry = map[i]
            let ref = entry[0]
            let obj = ref.value
            if (obj.isSome() && obj.getOrThrow() == key) {
                map.remove(at: i)
                return true
            }
        }
        return false
    }

    public func clear(): Unit {
        map = ArrayList()
    }

    public func size(): Int64 {
        var count: Int64 = 0
        for (entry in map) {
            let ref = entry[0]
            if (ref.value.isSome()) {
                count += 1
            }
        }
        return count
    }
}
