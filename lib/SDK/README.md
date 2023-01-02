# SDK客户端
添加API的步骤,以用户登录为例
## 添加Domain/Type/Model
1. 添加API中涉及到的类Account到Model文件夹.取名为Account.dart,内容从_ModelTemplate.dart复制
2. 替换文件中的所有ModelTemplate为Account
3. 里面的Id字段是示例,根据不同的模型信息修改字段.比如,Account类还需要Id,Nick,UserId,UserNick,IsSubUser,RegTime,Status,Password,Name,Sex,Mobile,Phone,Avatar,Country,Province,City,Lang,Memo
4. 使用终端运行 `flutter pub run build_runner build`即可生成用于序列化和反序列化的Account.g.dart文件

## 添加Response
1. 在API文件夹下根据API的分类添加文件夹.比如当前的分类可以取名为 User/Account/Role等.这个随意,我们暂时用User
2. 添加AccountLoginByPassResponse.dart到该文件夹中,内容从模板文件SDK/API/_ResponseTemplate.dart.txt中复制
3. 替换所有ModelTemplate为Account
4. 替换所有ResponseTemplate为AccountLoginByPassResponse
5. 由于dart不支持Account? Account;这种写法,所以要把response中的Account字段改写成

    `@JsonKey(name:"Account")`
    
    `Account? account;`
6. 运行`flutter pub run build_runner build`以生成AccountLoginByPassResponse.g.dart

## 添加Request
1. 像Response一样,复制模板内容并进行替换.
2. 修改getApiName的返回内容以匹配正式请求中method=xxx的那个query
3. 运行`flutter pub run build_runner build`

## 使用API
1. 初始化一个SDKClient,在

   `void main() => runApp(const MyApp());`
下面添加:
`SDKClient sdkClient = SDKClient("https://enni.group/netserver/router.aspx?", DateTime(0,0,0,0,0,5));`
`
2. 在组件的Widget 返回值的build函数体中 或者在别的地方定义request和response的promise/future
   var req = WareHouseTakeOverBillDetailsGetRequest(PageNum: 1)
   ..StartSendTime = DateTime(2022,4,1)
   ..EndSendTime = DateTime(2022,10,1)
   ..TakeoverWhoUserId = 100002
   ..PageSize = 2;
   var rsp = sdkClient.execute(request: req, session: '1717');

其中Response()..Field1=xxx
..Field2=xxx的方式为dart独有的 类似于 C#的 
new Response()
{
   Field1=xxx,
   Field2=xxx
}

3. 在任何地方使用组件时候像这样使用(代替 Text("content") 的地方)
   child: FutureBuilder<WareHouseTakeOverBillDetailsGetResponse>(
   future: rsp,
   builder: (context,snapshot){
   if(snapshot.hasData)
   {
   var json = jsonEncode(snapshot.data);
   var res = snapshot.data;
   if(res!= null)
   {
   if(res.IsError) {
   return Text("返回了错误\r\n${res.ErrMsg}",style: const TextStyle(color: Colors.red),);
   }
   else {
   return Padding(padding: const EdgeInsets.all(50), child:
   Text("有数据了!!!\r\n$json")
   ,);
   }
   }
   // res.ErrCode
   return const Text("res是空的");
   }
   return const CircularProgressIndicator();
   },
   ),

也可以直接使用 rsp.then直接返回结果,而不是等FutureBuilder在组件加载后调用.