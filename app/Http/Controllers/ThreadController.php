<?php

namespace App\Http\Controllers;

use App\Thread;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class ThreadController extends Controller
{

    function __construct()
    {
        return $this->middleware('auth')->except('index');
    }


    public function index(Request $request)
    {
        if ($request->has('tags')){

            //this takes all the thread related to the tag
            $tag = Tag::find($request->tags);
            $threads= $tag->threads;
        }else {

            $threads = Thread::paginate(15);
        }
        return view('thread.index', compact('threads'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('thread.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // validate
        $this->validate($request,[
            'subject' => 'required|min:5',
            'tags'   => 'required',
            'thread' => 'required|min:10',
            //'g-recaptcha-response' => 'required|captcha'
        ]);


        //store
       $thread= auth()->user()->threads()->create($request->all());
      // Thread::create($request->all());

        //this is where we attach  tags with thread
        $thread->tags()->attach($request->tags);
        //redirect

        return back()->withMessage('Thread Created successfully!   ');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Thread  $thread
     * @return \Illuminate\Http\Response
     */
    public function show(Thread $thread)
    {
        return view('thread.single',compact('thread'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Thread  $thread
     * @return \Illuminate\Http\Response
     */
    public function edit(Thread $thread)
    {
        return view('thread.edit',compact('thread'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Thread  $thread
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Thread $thread)
    {
//        if (auth()->user()->id !== $thread->user_id){
//            abort(401,'Unauthorized');
//        }


        $this->authorize('update',$thread);
//        // validate
        $this->validate($request,[
            'subject' => 'required|min:5',
            'type'   => 'required',
            'thread' => 'required|min:10',
            'g-recaptcha-response' => 'required|captcha'
        ]);
        // not needed here auth()->user()->threads();
        //update

        $thread->update($request->all());

        //Redirect user
        return redirect()->route('threads.show',$thread->id)->withMessage('Thread Updated!');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Thread  $thread
     * @return \Illuminate\Http\Response
     */
    public function destroy(Thread $thread)
    {
//        if (auth()->user()->id !== $thread->user_id){
//            abort(401,'Unauthorized');
//        }
        $this->authorize('update',$thread);
        $thread->delete();
        return redirect()->route('threads.index')->withMessage('Thread Deleted!');
    }

    public function markAsSolution()
    {
        $solutionId = Input::get('solutionId');
        $threadId = Input::get('threadId');
        $thread=Thread::find($threadId);
        $thread->solution = $solutionId;
        if ($thread->save()){
            return back()->withMessage('Marked as solution');
        }
    }


}
