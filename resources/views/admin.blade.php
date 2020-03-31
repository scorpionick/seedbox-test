@extends('layouts.app')

@section('content')
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-header">
            <h3>Servers
              <button class="btn btn-outline-dark float-right"
                      role="button"
                      data-toggle="modal"
                      data-target="#server-modal"
                      data-server-id="0">
                <i class="fas fa-plus"></i> Add a new server
              </button>
            </h3>
          </div>
          <div class="card-body">
            @if($serversDown > 0)
              <div class="alert alert-warning" role="alert"><i class="fas fa-exclamation-triangle"></i>
                {{$serversDown}} servers are currently down.
              </div>
            @endif
            @include("serversTable")
          </div>
        </div>
      </div>
    </div>
  </div>
  @include("serverModal")
@endsection
