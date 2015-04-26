<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <link href="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.css" rel="stylesheet">
        <!-- Notify CSS -->
        <link href="http://goodybag.github.io/bootstrap-notify/css/bootstrap-notify.css" rel="stylesheet">

        <!-- Custom Styles -->
        <link href="http://goodybag.github.io/bootstrap-notify/css/styles/alert-blackgloss.css" rel="stylesheet">

        <asset:javascript src="jquery" />
        <asset:javascript src="spring-websocket" />

        <script src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.js"></script>
        <script src="http://goodybag.github.io/bootstrap-notify/js/bootstrap-notify.js"></script>

        <script type="text/javascript">
            $(function() {
                var socket = new SockJS("${createLink(uri: '/stomp')}");
                var client = Stomp.over(socket);

                client.connect({}, function() {
                    client.subscribe("/topic/hello", function(message) {
                      $('.bottom-right').notify({
                         message: { text: message.body }, type: 'blackgloss'
                       }).show();
                    });
                });

                $("#pubButton").click(function() {
                    var msg = $('#pubInput').val()
                    client.send("/app/hello", {}, JSON.stringify(msg.trim() == '' ? 'world' : msg));
                });
            });
        </script>
    </head>
    <body>
      <div id="page-wrapper">

          <div class="container-fluid">

              <!-- Page Heading -->
              <div class="row">
                  <div class="col-lg-12">
                      <h1 class="page-header">
                          Dashboard
                      </h1>
                      <ol class="breadcrumb">
                          <li class="active">
                              <i class="fa fa-dashboard"></i> Dashboard
                          </li>
                      </ol>
                  </div>
              </div>
              <!-- /.row -->

              <div class="row">
                  <div class="col-lg-3 col-md-6">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                              <div class="row">
                                  <div class="col-xs-3">
                                      <i class="fa fa-comments fa-5x"></i>
                                  </div>
                                  <div class="col-xs-9 text-right">
                                      <div class="huge">26</div>
                                      <div>New Comments!</div>
                                  </div>
                              </div>
                          </div>
                          <a href="#">
                              <div class="panel-footer">
                                  <span class="pull-left">View Details</span>
                                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                  <div class="clearfix"></div>
                              </div>
                          </a>
                      </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                      <div class="panel panel-green">
                          <div class="panel-heading">
                              <div class="row">
                                  <div class="col-xs-3">
                                      <i class="fa fa-tasks fa-5x"></i>
                                  </div>
                                  <div class="col-xs-9 text-right">
                                      <div class="huge">12</div>
                                      <div>New Tasks!</div>
                                  </div>
                              </div>
                          </div>
                          <a href="#">
                              <div class="panel-footer">
                                  <span class="pull-left">View Details</span>
                                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                  <div class="clearfix"></div>
                              </div>
                          </a>
                      </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                      <div class="panel panel-yellow">
                          <div class="panel-heading">
                              <div class="row">
                                  <div class="col-xs-3">
                                      <i class="fa fa-shopping-cart fa-5x"></i>
                                  </div>
                                  <div class="col-xs-9 text-right">
                                      <div class="huge">124</div>
                                      <div>New Orders!</div>
                                  </div>
                              </div>
                          </div>
                          <a href="#">
                              <div class="panel-footer">
                                  <span class="pull-left">View Details</span>
                                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                  <div class="clearfix"></div>
                              </div>
                          </a>
                      </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                      <div class="panel panel-red">
                          <div class="panel-heading">
                              <div class="row">
                                  <div class="col-xs-3">
                                      <i class="fa fa-support fa-5x"></i>
                                  </div>
                                  <div class="col-xs-9 text-right">
                                      <div class="huge">13</div>
                                      <div>Support Tickets!</div>
                                  </div>
                              </div>
                          </div>
                          <a href="#">
                              <div class="panel-footer">
                                  <span class="pull-left">View Details</span>
                                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                  <div class="clearfix"></div>
                              </div>
                          </a>
                      </div>
                  </div>
              </div>
              <!-- /.row -->

              <div class="row">
                  <div class="col-lg-4">
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i>Alerta Geral</h3>
                          </div>
                          <div class="panel-body">
                              <input id="pubInput" type="text" class="form-control" placeholder="Mensagem para envio">
                              <button id="pubButton" class="btn btn-primary">Publicar</button>
                              <div class='notifications bottom-right'></div>
                          </div>
                      </div>
                  </div>
                  <div class="col-lg-4">
                      <div class="panel panel-default">
                          <div class="panel-heading">
                              <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Transactions Panel</h3>
                          </div>
                          <div class="panel-body">
                              <div class="table-responsive">
                                  <table class="table table-bordered table-hover table-striped">
                                      <thead>
                                          <tr>
                                              <th>Order #</th>
                                              <th>Order Date</th>
                                              <th>Order Time</th>
                                              <th>Amount (USD)</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <tr>
                                              <td>3326</td>
                                              <td>10/21/2013</td>
                                              <td>3:29 PM</td>
                                              <td>$321.33</td>
                                          </tr>
                                          <tr>
                                              <td>3325</td>
                                              <td>10/21/2013</td>
                                              <td>3:20 PM</td>
                                              <td>$234.34</td>
                                          </tr>
                                          <tr>
                                              <td>3324</td>
                                              <td>10/21/2013</td>
                                              <td>3:03 PM</td>
                                              <td>$724.17</td>
                                          </tr>
                                          <tr>
                                              <td>3323</td>
                                              <td>10/21/2013</td>
                                              <td>3:00 PM</td>
                                              <td>$23.71</td>
                                          </tr>
                                          <tr>
                                              <td>3322</td>
                                              <td>10/21/2013</td>
                                              <td>2:49 PM</td>
                                              <td>$8345.23</td>
                                          </tr>
                                          <tr>
                                              <td>3321</td>
                                              <td>10/21/2013</td>
                                              <td>2:23 PM</td>
                                              <td>$245.12</td>
                                          </tr>
                                          <tr>
                                              <td>3320</td>
                                              <td>10/21/2013</td>
                                              <td>2:15 PM</td>
                                              <td>$5663.54</td>
                                          </tr>
                                          <tr>
                                              <td>3319</td>
                                              <td>10/21/2013</td>
                                              <td>2:13 PM</td>
                                              <td>$943.45</td>
                                          </tr>
                                      </tbody>
                                  </table>
                              </div>
                              <div class="text-right">
                                  <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- /.row -->

          </div>
          <!-- /.container-fluid -->

      </div>
      <!-- /#page-wrapper -->

    </body>
</html>
