<table id="servers-table" class="table table-bordered table-hover table-striped">
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