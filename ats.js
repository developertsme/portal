var app = angular.module('myApp', []);

function alertme(heading, formContent) {
    html = '<div id="dynamicModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirm-modal" aria-hidden="true">';
    html += '<div class="modal-dialog">';
    html += '<div class="modal-content">';
    html += '<div class="modal-header">';
    html += '<h4>' + heading + '</h4>'
    html += '<a class="close" class="pull-right" data-dismiss="modal">×</a>';
    html += '</div>';
    html += '<div class="modal-body">';
    html += formContent;
    html += '</div>';
    html += '<div class="modal-footer">';
    html += '<span class="btn btn-primary" data-dismiss="modal">Close</span>';
    html += '</div>';  // content
    html += '</div>';  // dialog
    html += '</div>';  // footer
    html += '</div>';  // modalWindow
    $('body').append(html);
    $("#dynamicModal").modal();
    $("#dynamicModal").modal('show');

    $('#dynamicModal').on('hidden.bs.modal', function (e) {
        $(this).remove();
    });

}

function showright() {
    $(".app").addClass('aside-menu-lg-show');
}
function showright1() {
    $(".app").addClass('aside-menu-lg-show');
    $(".atsside")[0].click()
}
function showright2() {
    $(".app").addClass('aside-menu-lg-show');
    $(".atsside")[1].click()
}
function showright3() {
    $(".app").addClass('aside-menu-lg-show');
    $(".atsside")[2].click()
}
function sidetab1(page, id) {
    $(".app").addClass(' aside-menu-lg-show');
    try {
        //tab1
        var scope = angular.element(document.getElementById('myangular')).scope();
        scope.$apply(function () {
            scope.updateCustomRequest(id);
        });
    } catch (e) { }
    try {
        //tab2
        var scope2 = angular.element(document.getElementById('myangular1')).scope();
        scope2.$apply(function () {
            scope2.updateCustomRequest(id);
        });
    } catch (e) { }
    try {
        //tab3
        var scope3 = angular.element(document.getElementById('myangular2')).scope();
        scope3.$apply(function () {
            scope3.updateCustomRequest(id);
        });
    } catch (e) { }
}

function loader() {
    $('.modal').modal('show');
}
function loaderHide() {
    $('.modal').modal('hide');
}
function autoLoader() {
    loader();
    setTimeout(function () { loaderHide(); }, 1000);
}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

app.controller('maindashboard', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_products");
        $http({
            url: 'api.aspx?action=get_products',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }
}]);
app.controller("main_neworder", function ($scope, $http) {
    $scope.txtprice = 0;
    $scope.txtquantity = 0;
    $scope.txtdisper = 0;
    $scope.txtdisamount = 0;
    $scope.txtdispervoucher = 0;
    $scope.txtdisamountvoucher = 0;
    $scope.txttotal = 0;
    $scope.prodid = '';
    orderItems();


    function orderItems() {
        var encodedString = 'action=' +
            encodeURIComponent("get_orderItems") +
            '&id=' +
            encodeURIComponent(jQuery("#lblOrderID").html());
        $http({
            url: 'api.aspx?action=get_orderItems',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.dataOrderItems = response.data;
                } catch (e) {
                    $scope.txtproduct = "No Data Found";
                }
            },
                function (response) {
                });
    }
    $scope.searchProduct = function () {
        var encodedString = 'action=' +
            encodeURIComponent("search_product") +
            '&id=' +
            encodeURIComponent($scope.txtproduct);
        $http({
            url: 'api.aspx?action=search_product',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.dataproduct = response.data;
                    $scope.searchresult = "Found " + response.data.length;
                    orderItems();
                } catch (e) {
                    $scope.txtproduct = "No Data Found";
                }
            },
                function (response) {
                });
    };
    $scope.searchProductModal = function () {
        var encodedString = 'action=' +
            encodeURIComponent("search_product") +
            '&id=' +
            encodeURIComponent($("#txtproductid").val());
        $http({
            url: 'api.aspx?action=search_product',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.dataproduct = response.data;
                    if ($scope.txtquantity < 1) {
                        $scope.txtquantity = 1;
                    }
                    $scope.searchresult = "Found " + response.data.length;
                } catch (e) {
                    $scope.txtproduct = "No Data Found";
                }
            },
                function (response) {
                });
    };

    $scope.addProductToOrder = function () {
        if (jQuery("#lblOrderID").html() == 'No Order') {
            alert("No Order Created");
        }
        else {

            autoLoader();
            var encodedString = 'action=' +
                encodeURIComponent("add_product_order") +
                '&orderid=' +
                encodeURIComponent(jQuery("#lblOrderID").html()) +
                '&productid=' +
                encodeURIComponent($scope.prodid) +
                    '&price=' +
                encodeURIComponent($scope.txtprice) +
                    '&qty=' +
                encodeURIComponent($scope.txtquantity) +
                    '&total=' +
                encodeURIComponent($scope.txttotal);
            $http({
                url: 'api.aspx?action=add_product_order',
                method: 'POST',
                data: encodedString,
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
                .then(function (response) {
                    try {
                        orderItems();
                    } catch (e) {
                   
                    }
                },
                    function (response) {
                    });
        }
    };

    $scope.updateTotal = function () {
        if ($("#txtproductid").val().length > 4) {
            $scope.searchProductModal();
        }
        try {
            count = $scope.dataproduct.length;
            for (i = 0; i <= count; i++) {
                if ($scope.dataproduct[i].name.trim() == $scope.txtproduct.trim()) {
                    $scope.txtprice = $scope.dataproduct[i].price;
                    $scope.prodid = $scope.dataproduct[i].id;
                    $scope.txttotal = $scope.txtquantity * $scope.dataproduct[i].price;
                    break;
                }
            }
        }
        catch (err) { }
    }
});
app.controller("main_ticket", function ($scope, $http) {

    loadActivity();
    $scope.update_note = '';
    $scope.emailto = '';
    $scope.emailsubject = '';
    $scope.emailbody = '';
    $scope.emailcc = '';

    $scope.addTicket = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_ticket") +
            '&categoryid=' +
            encodeURIComponent($('#lstticketcategory').find(":selected").val()) +
            '&userid=' +
            encodeURIComponent(getUrlVars()['id']) +
            '&title=' +
            encodeURIComponent($('#txttitle').val()) +
            '&accountmanager=' +
            encodeURIComponent($('#lstaccountmanager').find(":selected").val()) +
            '&assignto=' +
            encodeURIComponent($('#lstassignedto').find(":selected").val()) +
            '&orderid=' +
            encodeURIComponent($('#lstorderid').find(":selected").val()) +
            '&orderitem=' +
            encodeURIComponent($('#lstorderitem').find(":selected").val()) +
            '&note=' +
            encodeURIComponent($('#txtnotes').val()) +
            '&tag=' +
            encodeURIComponent($('#txttags').val());
        $http({
            url: 'api.aspx?action=add_ticket',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                alertme("SUCCESS","Ticket Created");
            },
                function (response) {
            });
        
    }
    $scope.emailUpdate = function () {
        var encodedString = 'action=' +
            encodeURIComponent("email_contact_update") +
            '&id=' +
            encodeURIComponent(getUrlVars()['id']) +
            '&to=' +
            encodeURIComponent($scope.emailto) +
            '&cc=' +
            encodeURIComponent($scope.emailcc) +
            '&subject=' +
            encodeURIComponent($scope.emailsubject) +
            '&body=' +
            encodeURIComponent($scope.emailbody);
        $http({
            url: 'api.aspx?action=email_contact_update',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {

                alertme("SUCCESS", "Email Sent.");
                $scope.emailto = '';
                $scope.emailsubject = '';
                $scope.emailbody = '';
                $scope.emailcc = '';
            },
                function (response) {
                });
    }
    $scope.addUpdate = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_ticket_update") +
            '&id=' +
            encodeURIComponent(getUrlVars()['id']) +
            '&userid=' +
            encodeURIComponent(getUrlVars()['id']) +
            '&head=' +
            encodeURIComponent($('#lstticketstatus').find(":selected").val()) +
            '&body=' +
            encodeURIComponent($scope.update_note);
        $http({
            url: 'api.aspx?action=add_ticket_update',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {

                alertme("SUCCESS", "Ticket Updated");
                $scope.update_note = '';
                loadActivity();
            },
                function (response) {
                });
    }

    var encodedString = 'action=' +
            encodeURIComponent("get_customer_tickets") +
            '&id=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=get_customer_tickets',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.dataticket = response.data;
                } catch (e) {
                }
            },
                function (response) {
        });

    function loadActivity() {
        var encodedString = 'action=' +
            encodeURIComponent("get_ticket_rev") +
            '&id=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=get_ticket_rev',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.datarev = response.data;
                } catch (e) {
                }
            },
                function (response) {
                });
    }

    var encodedString = 'action=' +
        encodeURIComponent("get_ticket_category_list") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_ticket_category_list',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            try {
                $scope.dataticketcategory = response.data;
            } catch (e) {
            }
        },
            function (response) {
        });

    var encodedString = 'action=' +
        encodeURIComponent("get_backend_accounts") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_backend_accounts',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            try {
                $scope.datauser = response.data;
            } catch (e) {
            }
        },
            function (response) {
        });


    var encodedString = 'action=' +
        encodeURIComponent("get_customer_order") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_customer_order',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            try {
                $scope.dataorderid = response.data;
            } catch (e) {
            }
        },
            function (response) {
            });
 
});
app.controller("main_view_ticket", function ($scope, $http, $sce) {

    $('#txttaskdatetime').val(new Date().toISOString().substr(0, 10));
    $scope.activity_note = '';
    loadActivity();
    $scope.emailto = '';
    $scope.emailsubject = '';
    $scope.emailbody = '';
    $scope.emailcc = '';
    $scope.emailbodyreply = '';
    $scope.addUpdate = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_ticket_update") +
            '&id=' +
            encodeURIComponent(getUrlVars()['id']) +
            '&userid=' +
            encodeURIComponent($("#userid").val()) +
            '&head=' +
            encodeURIComponent('Note') +
            '&body=' +
            encodeURIComponent($scope.activity_note);
        $http({
            url: 'api.aspx?action=add_ticket_update',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.activity_note = '';
                alertme("Success", "Note Update Saved");
            },
                function (response) {
                });
    }
    $scope.emailUpdate = function () {
        var encodedString = 'action=' +
            encodeURIComponent("email_ticket_update") +
            '&id=' +
            encodeURIComponent(getUrlVars()['id']) +
            '&to=' +
            encodeURIComponent($scope.emailto) +
            '&cc=' +
            encodeURIComponent($scope.emailcc) +
            '&subject=' +
            encodeURIComponent($scope.emailsubject) +
            '&body=' +
            encodeURIComponent($scope.emailbody);
        $http({
            url: 'api.aspx?action=email_ticket_update',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.emailto = '';
                $scope.emailsubject = '';
                $scope.emailbody = '';
                $scope.emailcc = '';
                alertme("Sent", "Ticket Updated. Email Sent.");
                loadActivity();
            },
                function (response) {
                });
    }
    $scope.emailUpdateReply = function () {
        var encodedString = 'action=' +
            encodeURIComponent("email_ticket_update_customer") +
            '&id=' +
            encodeURIComponent($("#txtticketid").text()) +
            '&body=' +
            encodeURIComponent($scope.emailbodyreply);
        $http({
            url: 'api.aspx?action=email_ticket_update_customer',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.emailbodyreply = '';
                alertme("Success", "Customer Email Updated.");
                loadActivity();
            },
                function (response) {
                });
    }
    $scope.addTask = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_task") +
            '&subject=' +
            encodeURIComponent($('#txttasksubject').val()) +
            '&note=' +
            encodeURIComponent($('#txtnote').val()) +
            '&deadline=' +
            encodeURIComponent($('#txttaskdatetime').val()) +
            '&reminder=' +
            encodeURIComponent($('#txtreminder').find(":selected").text()) +
            '&assignto=' +
            encodeURIComponent($('#txtassignto').find(":selected").val()) +
            '&createdby=' +
            encodeURIComponent($('#lblmasteruser').text());
        $http({
            url: 'api.aspx?action=add_task',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                alertme("Success", "Task Created");
            },
                function (response) {
                });
    }

    function loadActivity() {
        var encodedString = 'action=' +
            encodeURIComponent("get_ticket_emails") +
            '&id=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=get_ticket_emails',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.datarevemail = response.data;
                } catch (e) {
                }
            },
                function (response) {
                });
    }
    $scope.to_trusted = function (html_code) {
        return $sce.trustAsHtml(html_code);
    }
    var encodedString = 'action=' +
        encodeURIComponent("get_backend_accounts") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_backend_accounts',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            try {
                $scope.datauser = response.data;
            } catch (e) {
            }
        },
            function (response) {
        });

});

app.controller("main_view_shop", function ($scope, $http, $sce) {
    
    loadActivity();
    loadActivityCustomer();
    $scope.txtaddress = '';
    $scope.txtcontactname = '';
    $scope.txtcontactnumber = '';

    $scope.txtcustomer = '';

    $scope.addBranch = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_shop_branch") +
            '&address=' +
            encodeURIComponent($scope.txtaddress) +
            '&contactname=' +
            encodeURIComponent($scope.txtcontactname) +
            '&contactnumber=' +
            encodeURIComponent($scope.txtcontactnumber) +
            '&parentid=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=add_shop_branch',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                alertme("Success", "Branch Created");
                $scope.txtaddress = '';
                $scope.txtcontactname = '';
                $scope.txtcontactnumber = '';
                loadActivity();
            },
                function (response) {
                });
    }
    $scope.addCustomer = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_shop_customer") +
            '&customer=' +
            encodeURIComponent($scope.txtcustomer) +
            '&parentid=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=add_shop_customer',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                alertme("Success", "Shop Customer Created");
                $scope.txtcustomer = '';
                loadActivityCustomer();
            },
                function (response) {
                });
    }
    function loadActivity() {
        var encodedString = 'action=' +
            encodeURIComponent("get_shop_branch") +
            '&id=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=get_shop_branch',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.dataBranchItems = response.data;
                } catch (e) {
                }
            },
                function (response) {
                });
    }
    function loadActivityCustomer() {
        var encodedString = 'action=' +
            encodeURIComponent("get_shop_customer") +
            '&id=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=get_shop_customer',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                try {
                    $scope.dataCustomerItems = response.data;
                } catch (e) {
                }
            },
                function (response) {
                });
    }

});
app.controller('main_profile', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
    $('#txttaskdatetime').val(new Date().toISOString().substr(0, 10));

    $scope.addTask = function () {
        var encodedString = 'action=' +
            encodeURIComponent("add_task") +
            '&subject=' +
            encodeURIComponent($('#txttasksubject').val()) +
            '&note=' +
            encodeURIComponent($('#txtnote').val()) +
            '&deadline=' +
            encodeURIComponent($('#txttaskdatetime').val()) +
            '&reminder=' +
            encodeURIComponent($('#txtreminder').find(":selected").text()) +
            '&assignto=' +
            encodeURIComponent($('#txtassignto').find(":selected").val()) +
            '&createdby=' +
            encodeURIComponent($('#lblmasteruser').text());
        $http({
            url: 'api.aspx?action=add_task',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                alertme("SUCCESS", "Task Created.");
            },
                function (response) {
                });
    }

    var encodedString = 'action=' +
        encodeURIComponent("get_backend_accounts") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_backend_accounts',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            try {
                $scope.datauser = response.data;
            } catch (e) {
            }
        },
            function (response) {
            });
}]);
app.controller("main_viewuser", function ($scope, $http) {
    $scope.orderCount = 0;
    $scope.paymentCount = 0;
    $scope.ticketCount = 0;
    $scope.wishCount = 0;

    var encodedString = 'action=' +
        encodeURIComponent("get_customer_order") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_customer_order',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            $scope.orderlist = response.data;
            $scope.orderCount = response.data.length;
        },
            function (response) {
        });


    var encodedString = 'action=' +
        encodeURIComponent("get_customer_payment") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_customer_payment',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            $scope.paymentlist = response.data;
            $scope.paymentCount = response.data.length;
        },
            function (response) {
        });

    var encodedString = 'action=' +
        encodeURIComponent("get_customer_tickets") +
        '&id=' +
        encodeURIComponent(getUrlVars()["id"]);
    $http({
        url: 'api.aspx?action=get_customer_tickets',
        method: 'POST',
        data: encodedString,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
        .then(function (response) {
            $scope.ticketlist = response.data;
            $scope.ticketCount = response.data.length;
        },
            function (response) {
            });
});

app.controller('main_contact', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
    $scope.activity_note = '';
    loadActivity();

    function loadActivity() {
        var encodedString = 'action=' +
            encodeURIComponent("get_contact_activity_list") +
            '&id=' +
            encodeURIComponent(getUrlVars()["id"]);
        $http({
            url: 'api.aspx?action=get_contact_activity_list',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }
    $scope.addNote = function () {
            var encodedString = 'action=' +
                encodeURIComponent("add_contact_activity") +
                '&id=' +
                encodeURIComponent(getUrlVars()['id']) +
                '&head=' +
                encodeURIComponent('Note') +
                '&body=' +
                encodeURIComponent($scope.activity_note);
            $http({
                url: 'api.aspx?action=add_contact_activity',
                method: 'POST',
                data: encodedString,
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
                .then(function (response) {
                    alertme("SUCCESS", "Note Created");
                    $scope.activity_note = '';
                    loadActivity();
                },
                    function (response) {
                    });
    }
    
}]);

app.controller('tab1_viewUser', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_order") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_order',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }
}]);
app.controller('tab1_supportticket', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_ticket_activity_list") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_ticket_activity_list',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }
}]);
app.controller('tab1_orderList', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_customer_details_by_order") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_customer_details_by_order',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
            });


        var encodedString = 'action=' +
            encodeURIComponent("get_order_details") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_order_details',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.orderlist = response.data;
            },
                function (response) {
                });
    }
}]);
app.controller('tab2_orderList', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_orderItems") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_orderItems',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }
}]);
app.controller('tab3_orderList', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_order_payment") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_order_payment',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }

    $scope.getTotal = function () {
        try {
            var total = 0;
            for (var i = 0; i < $scope.datalist.length; i++) {
                var product = $scope.datalist[i];
                total += parseFloat(product.value);
            }
            return total;
        } catch (e) { }
    }
}]);

app.controller('tab1_profile', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};

    $scope.updateCustomRequest = function (id) {
        var encodedString = 'action=' +
            encodeURIComponent("get_task") +
            '&id=' +
            encodeURIComponent(id);
        $http({
            url: 'api.aspx?action=get_task',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                $scope.datalist = response.data;
            },
                function (response) {
                });
    }
}]);

app.controller('modal_customersearch', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};
    $scope.txtproduct = '';
    $scope.noresult = '';
    $scope.changeProd = function (id) {
        $('#myModal').modal('hide');
        $("#txtproductid").val(id);
        $("#txtproductid").trigger('input'); // Use for Chrome/Firefox/Edge
        $("#txtproductid").trigger('change'); // Use for Chrome/Firefox/Edge + IE11
    }
    $scope.changeUser = function (id) {
        $('#myModal').modal('hide');
        $("#txtcustomer").val(id);
        $("#txtcustomer").trigger('input'); // Use for Chrome/Firefox/Edge
        $("#txtcustomer").trigger('change'); // Use for Chrome/Firefox/Edge + IE11
    }

    $scope.searchUser = function (id) {
        $scope.noresult = 'Searching.........';
        var encodedString = 'action=' +
            encodeURIComponent("get_searchcustomer") +
            '&id=' +
            encodeURIComponent($scope.txtproduct);
        $http({
            url: 'api.aspx?action=get_searchcustomer',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                if (response.data.length > 0) {
                    $scope.datalist = response.data;
                    $scope.noresult = '';
                }
                else {
                    $scope.datalist = [];
                    $scope.noresult = 'NO RESULTS FOUND';
                }
                
            },
                function (response) {
                });
    }
}]);
app.controller('modal_productsearch', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {

    $scope.customParams = {};
    $scope.txtproduct = '';
    $scope.noresult = '';
    $scope.changeProd = function (id) {
        $('#myModal').modal('hide');
        $("#txtproductid").val(id);
        $("#txtproductid").trigger('input'); // Use for Chrome/Firefox/Edge
        $("#txtproductid").trigger('change'); // Use for Chrome/Firefox/Edge + IE11
    }
    $scope.searchProd = function (id) {
        $scope.noresult = 'Searching.........';
        var encodedString = 'action=' +
            encodeURIComponent("get_searchproduct") +
            '&id=' +
            encodeURIComponent($scope.txtproduct);
        $http({
            url: 'api.aspx?action=get_searchproduct',
            method: 'POST',
            data: encodedString,
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .then(function (response) {
                if (response.data.length > 0) {
                    $scope.datalist = response.data;
                    $scope.noresult = '';
                }
                else {
                    $scope.datalist = [];
                    $scope.noresult = 'NO RESULTS FOUND';
                }

            },
                function (response) {
                });
    }
}]);
