<form id="server-form">
  @csrf
  @method("PUT")
  <input type="hidden" name="server_id" value="{{ $server->id }}">
  <div class="form-group">
    <label for="name">Name</label>
    <input type="email" class="form-control" id="name" name="name" value="{{ old("name") ?? $server->name }}">
    @error("name") <div class="text-danger">{{ $message }}</div> @enderror
  </div>
  <div class="form-group">
    <label for="domain">Domain</label>
    <input type="text" class="form-control" id="domain" name="domain" value="{{ $server->domain }}">
    @error("domain") <div class="text-danger">{{ $message }}</div> @enderror
  </div>
  <div class="form-group">
    <label for="username">Username</label>
    <input type="text" class="form-control" id="username" name="username" value="{{ $server->username }}">
    @error("username") <div class="text-danger">{{ $message }}</div> @enderror
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control @error('password')is-invalid @enderror" id="password" name="password">
    @error("password") <div class="text-danger">{{ $message }}</div> @enderror
  </div>
</form>