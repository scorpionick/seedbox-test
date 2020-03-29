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
            <table class="table table-bordered table-hover table-striped">
              <thead>
              <th>Name</th>
              <th>Domain</th>
              <th>Domain</th>
              <th>Status</th>
              <th>Actions</th>
              </thead>
              <tbody>
              @foreach($servers as $server)
                <tr>
                  <td class="align-middle">{{ $server->name }}</td>
                  <td class="align-middle"></td>
                  <td class="align-middle"></td>
                  <td class="align-middle{{ $server->status ? "" : " table-danger" }}">{{ $server->status ? "Up" : "Down" }}</td>
                  <td class="align-middle" width="1">
                    <div class="btn-group" role="group" aria-label="Basic example">
                      <button type="button" class="btn btn-dark" title="Edit server">
                        <i class="fas fa-edit"></i> Edit
                      </button>

                      {{-- Restart and remove button are only present for visual --}}
                      <button type="button" class="btn btn-dark" title="Restart server">
                        <i class="fas fa-redo"></i> Restart
                      </button>
                      <button type="button" class="btn btn-dark" title="Remove server">
                        <i class="fas fa-trash"></i> Remove
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
@endsection
