const btnDelete = document.querySelector('#btnDelete');
const renderTable = document.querySelector('.js-renderData');
const closeDetailUser1 = document.querySelector('#closeDetailUser');
const statusAction = document.querySelector('#js-statusAction');
const empProfile11 = document.querySelector('.emp-profile');
const backgroundShadow1 = document.querySelector('.backgroundShadow');
const accountAdd = document.querySelector('#account-add');
const closeAddUser = document.querySelector('#closeAddUser');
const formAddAccount = document.querySelector('.formAddAccount');
const rowRole = document.querySelector('.js-role');
const avatarUser = document.querySelector('#avatarUser');
const insertAccount = document.querySelector('#insertAccount');

const addUserFullName = document.querySelector('#addUserFullName');
const addUserEmail = document.querySelector('#addUserEmail');
const addUserPhone = document.querySelector('#addUserPhone');
const addUserIdCard = document.querySelector('#addUserIdCard');
const addUserCompany = document.querySelector('#addUserCompany');
const addUserName = document.querySelector('#addUserName');
const addUserAddress = document.querySelector('#addUserAddress');
const notifyError = document.querySelectorAll('.notification');
const addLoading = document.querySelector('.addLoading');
const loading = document.querySelectorAll('.loading');
const addData = document.querySelectorAll('.addData');
const showEntries = document.querySelector('#showEntries');

let btnDetailAccount;
let deleteAccountUser;
let statusUser;
let arrayRoleAccount = [];

let trClass;

const dataSend = {};

// variable paging
let totalPage = 0;
let startPage = 1;
let records = 1;
// end variable paging

// general
$('#checkAllHead').click(function () {
  $('input:checkbox').not(this).prop('checked', this.checked);
});

const convertTimeStampToData = (data) => {
  return new Date((data / 1000 + 25200) * 1000)
    .toISOString()
    .slice(0, 19)
    .replace('T', ' ');
};

const REGX = /^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/;

const SPECIAL_CHARACTER = "!@#$%^&*()_+-=|][';/.,<>?:'";

const SPECIAL_CHARACTER_ADDRESS = "!@#$%^&*()_+-=|][';,<>?:'";

const REGX_IMAGE = /.*\.(gif|jpe?g|bmp|png)$/gim;
// end general

// validate
for (let i = 0; i < notifyError.length; i++) {
  notifyError[i].innerHTML = 'Invalid';
  notifyError[i].style.visibility = 'hidden';
}

const checkName = () => {
  notifyError[0].style.visibility = 'visible';

  notifyError[0].innerHTML =
    'Invalid. Must be 6 character and not exist special character';

  for (let i = 0; i < addUserFullName.value.length; i++) {
    if (SPECIAL_CHARACTER.includes(addUserFullName.value[i])) {
      notifyError[0].style.color = 'red';
      return false;
    }
  }

  if (addUserFullName.value.length < 6) {
    notifyError[0].style.color = 'red';
    return false;
  } else {
    notifyError[0].innerHTML = 'OK';
    notifyError[0].style.color = 'green';
    return true;
  }
};

const checkEmail = async () => {
  let status = false;
  if (addUserEmail.value.match(REGX)) {
    let res = await fetch(
      `http://localhost:8080/model/api-admin/account/checkaccount?email=${addUserEmail.value}`
    );
    let dataRes = await res.json();
    // .then(res => {
    //   return res.json();
    // })
    // .then(data => {
    //   if (data === 0) {
    //     notifyError[1].innerHTML = 'OK';
    //     notifyError[1].style.color = "green";
    //     status = true;
    //   } else {
    //     notifyError[1].innerHTML = 'Invalid. Email exist';
    //     notifyError[1].style.color = "red";
    //     status = false;
    //   }
    // })
    // .catch(error => {
    //   console.log(error);
    //   status = false;
    // })
    if (dataRes === 0) {
      notifyError[1].innerHTML = 'OK';
      notifyError[1].style.color = 'green';
      status = true;
    } else {
      notifyError[1].innerHTML = 'Invalid. Email exist.';
      notifyError[1].style.color = 'red';
      status = false;
    }
    return status;
  } else {
    notifyError[1].style.visibility = 'visible';

    notifyError[1].innerHTML = 'Invalid. Must be format xxxxx@x.x[...]';

    notifyError[1].style.color = 'red';
    return false;
  }
};

const checkPhone = () => {
  notifyError[2].style.visibility = 'visible';

  notifyError[2].innerHTML = 'Invalid. Must be from 9 to 11';

  if (addUserPhone.value.length < 9 || addUserPhone.value.length > 11) {
    notifyError[2].style.color = 'red';
    return false;
  } else {
    notifyError[2].innerHTML = 'OK';
    notifyError[2].style.color = 'green';
    return true;
  }
};

const checkIdCard = async () => {
  let status = false;
  notifyError[3].style.visibility = 'visible';

  notifyError[3].innerHTML =
    'Invalid. Must be from 9 to 12 character and not exist special character';

  for (let i = 0; i < addUserIdCard.value.length; i++) {
    if (SPECIAL_CHARACTER.includes(addUserIdCard.value[i])) {
      notifyError[3].style.color = 'red';
      return false;
    }
  }

  if (addUserIdCard.value.length < 9 || addUserIdCard.value.length > 12) {
    notifyError[3].style.color = 'red';
    return false;
  } else {
    let res = await fetch(
      `http://localhost:8080/model/api-admin/staff/idcard?idcard=${addUserIdCard.value}`
    );
    let dataRes = await res.json();
    if (dataRes === 0) {
      notifyError[3].innerHTML = 'OK';
      notifyError[3].style.color = 'green';
      status = true;
    } else {
      notifyError[3].innerHTML = 'Invalid. Id card exist';
      notifyError[3].style.color = 'red';
      status = false;
    }
    return status;
  }
};

const checkCompany = () => {
  notifyError[4].style.visibility = 'visible';

  notifyError[4].innerHTML =
    'Invalid. Must be 1 character and not exist special character';

  for (let i = 0; i < addUserCompany.value.length; i++) {
    if (SPECIAL_CHARACTER.includes(addUserCompany.value[i])) {
      notifyError[4].style.color = 'red';
      return false;
    }
  }

  if (addUserCompany.value.length < 1) {
    notifyError[4].style.color = 'red';
    return false;
  } else {
    notifyError[4].innerHTML = 'OK';
    notifyError[4].style.color = 'green';
    return true;
  }
};

const checkAddress = () => {
  notifyError[5].style.visibility = 'visible';

  notifyError[5].innerHTML =
    'Invalid. Must be 5 character and not exist special character';

  for (let i = 0; i < addUserAddress.value.length; i++) {
    if (SPECIAL_CHARACTER_ADDRESS.includes(addUserAddress.value[i])) {
      notifyError[5].style.color = 'red';
      return false;
    }
  }

  if (addUserAddress.value.length < 1) {
    notifyError[5].style.color = 'red';
    return false;
  } else {
    notifyError[5].innerHTML = 'OK';
    notifyError[5].style.color = 'green';
    return true;
  }
};

const checkUserName = async () => {
  let status = false;
  notifyError[6].style.visibility = 'visible';

  notifyError[6].innerHTML =
    'Invalid. Must be 6 character and not exist special character';

  for (let i = 0; i < addUserName.value.length; i++) {
    if (SPECIAL_CHARACTER.includes(addUserName.value[i])) {
      return false;
    }
  }

  if (addUserName.value.length < 6) {
    notifyError[6].style.color = 'red';
    return false;
  } else {
    let res = await fetch(
      `http://localhost:8080/model/api-admin/account/checkaccount?username=${addUserName.value}`
    );
    let dataRes = await res.json();
    if (dataRes === 0) {
      notifyError[6].innerHTML = 'OK';
      notifyError[6].style.color = 'green';
      status = true;
    } else {
      notifyError[6].innerHTML = 'Invalid. Username exist';
      notifyError[6].style.color = 'red';
      status = false;
    }
    return status;
  }
};
// end validate
// change status User
const renderUserById = (pos, data) => {
  console.log(pos, data);
  const tdClass = pos.getElementsByTagName('td');
  tdClass[9].innerHTML = convertTimeStampToData(data.modifieddate);
  tdClass[10].innerHTML = data.modifiedby;
  tdClass[11].innerHTML = data.note;
  return `<td><input type="checkbox" class="deleteAccountUser" data-check="${
    data.id
  }"</td>
                <td>${data.username}</td>
                <td>${data.email}</td>
                <td>${getRoleName(data.roles)}</td>
                <td>${renderSelectOption(data.status, data.id)}</td>
                <td>${data.codeverification}</td>
                <td>${convertTimeStampToData(data.expiredcode)}</td>
                <td>${convertTimeStampToData(data.createdate)}</td>
                <td>${data.createdby}</td>
                <td></td>
                <td></td>
                <td></td>
                <td><a
                class="btn btn-sm btn-primary btn-edit btn-detail"
                data-toggle="tooltip" title="Detail Account" data-id="${
                  data.id
                }"><i
                  class="fa fa-user" aria-hidden="true"></i></a></td></td>`;
};
const idStatusAccount = (data) => {
  for (let i = 0; i < data.length; i++) {
    data[i].addEventListener('change', function (event) {
      dataJSON = {};
      let id = data[i].getAttribute('data-statusUserId');
      let status = data[i].selectedIndex + 1;
      //let valueStatus = document.getElementsByTagName('option')[status].value;
      dataJSON['status'] = status;
      dataJSON['id'] = id;
      $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/model/api-admin/account/status',
        contentType: 'application/json',
        data: JSON.stringify(dataJSON),
        success: function (data) {
          statusAction.style.visibility = 'visible';
          statusAction.classList.add('alert-success');
          statusAction.innerHTML = `Change status account success`;
          renderUserById(trClass[i + 1], data);
          setTimeout(function () {
            statusAction.style.visibility = 'hidden';
            statusAction.classList.remove('alert-success');
            statusAction.innerHTML = `Status`;
          }, 3000);
        },
        error: function (data) {
          statusAction.style.visibility = 'visible';
          statusAction.classList.add('alert-danger');
          statusAction.innerHTML = `Change status account fail`;
          setTimeout(function () {
            statusAction.style.visibility = 'hidden';
            statusAction.classList.remove('alert-danger');
            statusAction.innerHTML = `Status`;
          }, 3000);
        },
      });
    });
  }
};

// read data user by id
const idAccount = (data) => {
  for (let i = 0; i < data.length; i++) {
    data[i].addEventListener('click', function (event) {
      let id = data[i].getAttribute('data-id');
      empProfile11.style.display = 'block';
      backgroundShadow1.style.display = 'block';
      $.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: 'http://localhost:8080/model/api-admin/account/' + id,
        success: function (data) {
          let dataRoles = '';
          for (let i = 0; i < data.roles.length; i++) {
            dataRoles += data.roles[i] + ' ';
          }
          $('#userImage').attr('src', data.avatar);
          document.querySelector('#userName').innerHTML =
            data.username + '[ ' + dataRoles + ' ]';
          if (data.phone) {
            document.querySelector('#userPhone').innerHTML =
              'Phone: ' + data.phone;
          } else {
            document.querySelector('#userPhone').innerHTML =
              'Phone: Currently there is no data';
          }
          if (data.address) {
            document.querySelector('#userAddress').innerHTML =
              'Address: ' + data.address;
          } else {
            document.querySelector('#userAddress').innerHTML =
              'Address: Currently there is no data';
          }
          document.querySelector('#userEmail').innerHTML =
            'Email: ' + data.email;
          document.querySelector('#userId').innerHTML = data.id;
          document.querySelector('#userFullName').innerHTML = data.name;
          if (data.company) {
            document.querySelector('#userCompany').innerHTML = data.company;
          } else {
            document.querySelector('#userCompany').innerHTML =
              'Current not data';
          }
          document.querySelector('#userSalary').innerHTML = data.salary;
          if (data.status === 0) {
            document.querySelector('#userStatus').innerHTML = 'HIDDEN';
          } else if (data.status === 1) {
            document.querySelector('#userStatus').innerHTML = 'LOCK';
          } else if (data.status === 2) {
            document.querySelector('#userStatus').innerHTML = 'INACTIVE';
          } else if (data.status === 3) {
            document.querySelector('#userStatus').innerHTML = 'ACTIVE';
          }
          if (data.gender === true) {
            document.querySelector('#userGender').innerHTML = 'Male';
          } else {
            document.querySelector('#userGender').innerHTML = 'Female';
          }
          if (data.idcard) {
            document.querySelector('#userIdCard').innerHTML = data.idcard;
          } else {
            document.querySelector('#userIdCard').innerHTML =
              'Current there is no data';
          }

          if (data.coefficients_salary) {
            document.querySelector('#cosalary').innerHTML =
              data.coefficients_salary;
          } else {
            document.querySelector('#cosalary').innerHTML =
              'Currently there is no data';
          }

          if (data.birthday) {
            document.querySelector('#birthday').innerHTML = data.birthday;
          } else {
            document.querySelector('#birthday').innerHTML =
              'Currently there is no data';
          }

          empProfile11.style.display = 'block';
          backgroundShadow1.style.display = 'block';
        },
        error: function (error) {
          console.log('error');
        },
      });
    });
  }
};
// end read data user by id

// render data account
const getRoleName = (roleArray) => {
  let roleName = '';
  for (let i = 0; i < roleArray.length; i++) {
    roleName += roleArray[i] + ' ';
  }
  return roleName;
};
const renderSelectOption = (status, id) => {
  return `
    <select class="statusUser" data-statusUserId="${id}">
      <option value="lock" ${status === 1 ? 'selected' : ''}>Lock</option>
      <option value="inactive" ${
        status === 2 ? 'selected' : ''
      }>InActive</option>
      <option value="active" ${status === 3 ? 'selected' : ''}>Active</option>
    </select>`;
};
const dataTemplateTable = (data) => {
  return `<td><input type="checkbox" class="deleteAccountUser" data-check="${
    data.id
  }"</td>
                <td>${data.username}</td>
                <td>${data.email}</td>
                <td>${getRoleName(data.roles)}</td>
                <td>${renderSelectOption(data.status, data.id)}</td>
                <td>${data.codeverification}</td>
                <td>${convertTimeStampToData(data.expiredcode)}</td>
                <td>${convertTimeStampToData(data.createdate)}</td>
                <td>${data.createdby}</td>
                <td>${convertTimeStampToData(data.modifieddate)}</td>
                <td>${data.modifiedby}</td>
                <td>${data.note}</td>
                <td><a
                class="btn btn-sm btn-primary btn-edit btn-detail"
                data-toggle="tooltip" title="Detail Account" data-id="${
                  data.id
                }"><i
                  class="fa fa-user" aria-hidden="true"></i></a></td></td>`;
};

const renderFindAllAccountAPI = (callback) => {
  fetch('http://localhost:8080/model/api-admin/account/findall')
    .then((res) => {
      return res.json();
    })
    .then((data) => {
      renderTable.innerHTML = '';
      for (let i = 0; i < data.length; i++) {
        let tr = document.createElement('tr');
        let template = dataTemplateTable(data[i]);
        tr.innerHTML = template;
        renderTable.appendChild(tr);
      }
      trClass = document.querySelectorAll('tr');
      statusUser = document.querySelectorAll('.statusUser');
      deleteAccountUser = document.querySelectorAll('.deleteAccountUser');
      btnDetailAccount = document.querySelectorAll('.btn-detail');
      callback(undefined, btnDetailAccount, statusUser);
    })
    .catch((error) => {
      callback(error, undefined, undefined);
    });
};
// end render account

renderFindAllAccountAPI((error, data1, data2) => {
  idAccount(data1);
  idStatusAccount(data2);
});

// delete account
const deleteAccountByIds = () => {
  const data = {};
  const arrayAccountIDPrepareDelete = [];
  for (let i = 0; i < deleteAccountUser.length; i++) {
    if (deleteAccountUser[i].checked) {
      let getAccountIDDelete = deleteAccountUser[i].getAttribute('data-check');
      arrayAccountIDPrepareDelete.push(getAccountIDDelete);
    }
  }
  data['ids'] = arrayAccountIDPrepareDelete;
  if (arrayAccountIDPrepareDelete.length <= 0) {
    statusAction.style.visibility = 'visible';
    statusAction.classList.add('alert-danger');
    statusAction.innerHTML = `Select Account Need Delete`;
    setTimeout(function () {
      statusAction.style.visibility = 'hidden';
      statusAction.classList.remove('alert-danger');
      statusAction.innerHTML = `Status`;
    }, 3000);
  } else {
    $.ajax({
      type: 'POST',
      contentType: 'application/json',
      url: 'http://localhost:8080/model/api-admin/account/delete',
      data: JSON.stringify(data),
      success: function (result) {
        statusAction.style.visibility = 'visible';
        statusAction.classList.add('alert-success');
        statusAction.innerHTML = `Delete ${arrayAccountIDPrepareDelete.length} account success`;
        renderFindAllAccountAPI((error, data1, data2) => {
          idAccount(data1);
          idStatusAccount(data2);
        });
        setTimeout(function () {
          statusAction.style.visibility = 'hidden';
          statusAction.classList.remove('alert-success');
          statusAction.innerHTML = `Status`;
        }, 3000);
      },
      error: function (error) {
        statusAction.style.visibility = 'visible';
        statusAction.classList.add('alert-danger');
        statusAction.innerHTML = `Delete account fail`;
        setTimeout(function () {
          statusAction.style.visibility = 'hidden';
          statusAction.classList.remove('alert-danger');
          statusAction.innerHTML = `Status`;
        }, 3000);
      },
    });
  }
};

btnDelete.addEventListener('click', deleteAccountByIds);
// end delete account

// close infor account
closeDetailUser1.addEventListener('click', function (event) {
  empProfile11.style.display = 'none';
  backgroundShadow1.style.display = 'none';
});
// end close infor account

// add account
const templateRole = (data) => {
  return `<label class="container role">${data.name} <input type="checkbox" value="${data.id}" class="checkboxRole"> <span class="checkmark"></span></label>`;
};

const renderRoleName = (_) => {
  fetch(
    `http://localhost:8080/model/api-admin/role/findall?field=id&direction=desc`
  )
    .then((res) => {
      return res.json();
    })
    .then((data) => {
      rowRole.innerHTML = '';
      for (let i = 0; i < data.length; i++) {
        rowRole.innerHTML += templateRole(data[i]);
      }

      const getDataCheck = document.querySelectorAll('.checkboxRole');
      for (let i = 0; i < getDataCheck.length; i++) {
        getDataCheck[i].addEventListener('change', function (event) {
          arrayRoleAccount = [];
          for (let j = 0; j < getDataCheck.length; j++) {
            if (getDataCheck[j].checked) {
              arrayRoleAccount.push(parseInt(getDataCheck[j].value));
            }
          }
          console.log(arrayRoleAccount);
        });
      }
    })
    .catch((error) => {
      console.log(error);
    });
};

accountAdd.addEventListener('click', function (event) {
  formAddAccount.style.display = 'flex';
  backgroundShadow1.style.display = 'block';

  // function can not use this here ?
  renderRoleName();
  // handling add account here ?
});

let statusAvatarChoose = false;
dataSend;
// handing image
avatarUser.addEventListener('change', function (event) {
  if (event.target.files[0].name.match(REGX_IMAGE)) {
    let reader = new FileReader();

    let file = event.target.files[0];

    let fileName = event.target.files[0].name;

    console.log(file);

    reader.onload = function (e) {
      let output = document.getElementById('output');
      //output.src = reader.result;
      //notifyError[9].style.visibility = 'hidden';
      statusAvatarChoose = true;
      dataSend['base64'] = e.target.result;
      dataSend['avatar'] = fileName;
    };

    reader.readAsDataURL(file);
  } else {
    notifyError[9].style.color = 'red';
    notifyError[9].style.visibility = 'visible';
    notifyError[9].innerHTML = 'Invalid. Please choose avatar';
    statusAvatarChoose = false;
  }
});
// end handing image

// add account
addUserName.addEventListener('keyup', checkUserName);
addUserFullName.addEventListener('keyup', checkName);
addUserPhone.addEventListener('keyup', checkPhone);
addUserEmail.addEventListener('keyup', checkEmail);
addUserIdCard.addEventListener('keyup', checkIdCard);
addUserCompany.addEventListener('keyup', checkCompany);
addUserAddress.addEventListener('keyup', checkAddress);

insertAccount.addEventListener('click', async function (event) {
  let statusEmail = false;
  let statusUsername = false;
  let statusIdCard = false;

  await checkEmail().then((data) => {
    statusEmail = data;
  });

  await checkIdCard().then((data) => {
    statusIdCard = data;
  });

  await checkUserName().then((data) => {
    statusUsername = data;
  });

  if (
    statusUsername === false ||
    checkName() === false ||
    checkPhone() === false ||
    statusEmail === false ||
    statusIdCard === false ||
    checkCompany() === false ||
    checkAddress() === false ||
    arrayRoleAccount.length === 0 ||
    statusAvatarChoose === false
  ) {
    checkUserName();
    checkName();
    checkPhone();
    checkEmail();
    checkIdCard();
    checkCompany();
    checkAddress();
    if (arrayRoleAccount.length < 1) {
      notifyError[7].style.color = 'red';
      notifyError[7].style.visibility = 'visible';
      notifyError[7].innerHTML = 'Invalid. Please choose at least 1 role';
    }

    notifyError[8].style.color = 'red';
    notifyError[8].style.visibility = 'visible';
    notifyError[8].innerHTML = 'Invalid. Try again';

    if (statusAvatarChoose === false) {
      notifyError[9].style.color = 'red';
      notifyError[9].style.visibility = 'visible';
      notifyError[9].innerHTML = 'Invalid. Please choose avatar';
    }
  } else {
    notifyError[8].style.visibility = 'hidden';

    addLoading.style.visibility = 'visible';
    loading[0].style.visibility = 'visible';
    loading[1].style.visibility = 'visible';
    let gender = document.querySelector('input[name="gender"]:checked').value;
    for (let i = 0; i < addData.length; i++) {
      dataSend['' + addData[i].name + ''] = addData[i].value;
    }
    dataSend['gender'] = parseInt(gender);
    dataSend['roleids'] = arrayRoleAccount;
    $.ajax({
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(dataSend),
      url: 'http://localhost:8080/model/api-admin/account/add',
      success: function (data) {
        for (let i = 0; i < addData.length; i++) {
          addData[i].value = '';
        }

        addLoading.style.visibility = 'visible';
        loading[0].style.visibility = 'hidden';
        loading[1].style.visibility = 'visible';
        loading[1].innerHTML = `Add account success`;
        renderFindAllAccountAPI((error, data1, data2) => {
          idAccount(data1);
          idStatusAccount(data2);
        });
        setTimeout(function () {
          addLoading.style.visibility = 'hidden';
          loading[0].style.visibility = 'hidden';
          loading[1].innerHTML = `Status`;
          loading[1].style.visibility = 'hidden';
        }, 3000);
      },
      error: function (error) {
        addLoading.style.visibility = 'hidden';
        loading[0].style.visibility = 'visible';
        loading[1].classList.add('alert-danger');
        loading[1].innerHTML = `Add account fail`;
        setTimeout(function () {
          addLoading.style.visibility = 'hidden';
          loading[0].style.visibility = 'hidden';
          loading[1].classList.remove('alert-danger');
          loading[1].innerHTML = `Status`;
          loading[1].style.visibility = 'hidden';
        }, 3000);
      },
    });
  }
});

closeAddUser.addEventListener('click', function (event) {
  for (let i = 0; i < addData.length; i++) {
    addData[i].value = '';
  }
  formAddAccount.style.display = 'none';
  backgroundShadow1.style.display = 'none';
});
// end add account

// paging

const pagingPage = () => {
  showEntries.innerHTML = `Showing 1 to 10 of ${totalPage} entries`;
  $('#pagination-demo').twbsPagination({
    totalPages: 10,
    visiblePages: 5,
    startPage: startPage,
    next: 'Next',
    prev: 'Prev',
    onPageClick: function (event, page) {
      console.log(page, totalPage);
    },
  });
};

pagingPage();

// end paging

// entires

// end entires
