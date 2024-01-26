---
layout: post
title:  "Rust: Traits"
date:   2024-01-26 21:06:18 +0000
categories: rust
---

A `trait` is a collection of methods defined for an unknown type: `Self`.
They can access other methods declared in the same `trait`, and can be
implemented for any data type.

{% highlight rust %}
trait Foo<T> {
    fn new() -> Self;
    fn test(&self, s: &String);
}
{% endhighlight %}

{% highlight rust %}
struct Bar<T> {
    value: T
}

impl<T> Foo<T> for Bar<T>
where
    T: Sized
{
    fn new() -> Self {
        Bar {
            value: 1
        }
    }

    fn test(&self, s: &String) {
        println!(s);
    }
}
{% endhighlight %}

{% highlight rust %}
let bar: Bar = Bar::<i32>::new();
bar.test(format!("hello"));
{% endhighlight %}