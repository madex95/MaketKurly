var _appData = {
    isLogin: true,
    isApp: false,
    memberNumber: 24766358,
    appPlatform: '',
    jwt: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjYXJ0X2lkIjoiZTc2ZTUzNzktMDZkMS00NDMyLWIzOTMtNDJjN2U2Mjc0NmNlIiwiaXNfZ3Vlc3QiOmZhbHNlLCJ1dWlkIjoiZTM3MjY3YjUtZmJmNy01ZjY3LWFkZWQtNzVlMjAwZWM5NzEzIiwibV9ubyI6MjQ3NjYzNTgsIm1faWQiOiJ0cmFjeTA0MjciLCJsZXZlbCI6MjAsInN1YiI6ImUzNzI2N2I1LWZiZjctNWY2Ny1hZGVkLTc1ZTIwMGVjOTcxMyIsImlzcyI6Imh0dHA6Ly9ta3dlYi5hcGkua3VybHkuc2VydmljZXMvdjMvYXV0aC9sb2dpbiIsImlhdCI6MTY0NDk3NzcxMiwiZXhwIjoxNjQ0OTgxMzEyLCJuYmYiOjE2NDQ5Nzc3MTIsImp0aSI6ImdJTGk1dTlQUzlGa1kwZTgifQ.w6tbx_9ASNBRES0yR12m1eUdkTiycac3qtHpy32TN60',
    apiHost: 'api.kurly.com',
    is_release_build: true,
    verCheck: [],
    uuid: 'e37267b5-fbf7-5f67-aded-75e200ec9713',
    isDirect: window.sessionStorage.getItem('isDirect') === '1' ? true : false
};

var appResult = {
    appCheck : _appData.isApp,
    appDevice : _appData.appPlatform,
    verCheck : _appData.verCheck,
    is_sess : _appData.isLogin,
    isSession : _appData.isLogin,
    is_release_build : _appData.is_release_build,
    timestamp: parseInt("1644978723025", 10)
}

if (_appData.isApp){
    var appVer, appVerLen, appVerCount;
    appVer = '';
    appVer = appVer.split('.');
    appVerLen = appVer.length;
    for(appVerCount = 0; appVerCount < appVerLen; appVerCount++){
        appResult.verCheck.push(appVer[appVerCount]);
    }
}

var webStatus = appResult;
