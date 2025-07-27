# 仓颉 WeakMap 和 WeakSet 的实现

### 底层依赖于 仓颉标准库中的 [std.Ref.WeakRef](https://cangjie-lang.cn/docs?url=%2F1.0.0%2Flibs%2Fstd%2Fref%2Fref_package_api%2Fref_package_classes.html%23class-weakreft-where-t--object)


```java

public class WeakMap<K, V> where K <: Object & Equatable<K> {
    private var map: ArrayList<(WeakRef<K>, V)> = ArrayList()

    public func set(key: K, value: V): Unit { }

    public func get(key: K): ?V { }

    public func has(key: K): Bool { }

    public func delete(key: K): Bool { }

}
```


```java

public class WeakSet<T> where T <: Object & Equatable<T> {
    private var set: ArrayList<WeakRef<T>> = ArrayList()

    public func set(key: K, value: V): Unit { }

    public func get(key: K): ?V { }

    public func has(key: K): Bool { }

    public func delete(key: K): Bool { }

    public func size(): Int64 { }

}
```
