@extends('layouts.app')

@section('content')
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-header">
            <h3>Servers
              <button class="btn btn-outline-dark float-right" role="button">
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
            <table class="table table-bordered table-hover table-striped">
              <thead>
              <th>Name</th>
              <th>Domain</th>
              <th>Username</th>
              <th>Status</th>
              <th>Actions</th>
              </thead>
              <tbody>
              @foreach($servers as $server)
                <tr>
                  <td class="align-middle">{{ $server->name }}</td>
                  <td class="align-middle">{{ $server->domain }}</td>
                  <td class="align-middle">{{ $server->username }}</td>
                  <td class="align-middle{{ $server->status ? "" : " table-danger" }}">{{ $server->status ? "Up" : "Down" }}</td>
                  <td class="align-middle text-nowrap" width="1">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <button type="button"
                              class="btn btn-dark edit-server"
                              title="Edit server"
                              data-toggle="modal"
                              data-target="#server-modal"
                              data-server-id="{{$server->id}}">
                        <div><i class="fas fa-edit"></i> Edit</div>
                      </button>
                    </div>
                  </td>
                </tr>
              @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  @include("serverModal")
@endsection
