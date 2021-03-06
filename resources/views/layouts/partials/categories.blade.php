<div class="col-md-3">
    <a class="btn btn-info" href="{{route('threads.create')}}">Create Thread</a><br><br>

    <h4>Tags</h4>
    <ul class="list-group">
        <a href="{{route('threads.index')}}" class="list-group-item">

            {{count('threads')}}
            All Threads
        </a>
        @foreach($tags as $tag)
        <a href="{{route('threads.index',['tags' =>$tag->id])}}" class="list-group-item">

            <span class="badge">14</span>
            {{$tag->name}}
        </a>
        @endforeach
        {{--this is what i formerly had in my stuff--}}
        {{--<a href="#" class="list-group-item">--}}
            {{--<span class="badge">2</span>--}}
            {{--PHP--}}
        {{--</a>--}}
        {{--<a href="#" class="list-group-item">--}}
            {{--<span class="badge">1</span>--}}
            {{--Java--}}
        {{--</a>--}}
    </ul>
</div>