
const serviceUrl = 'http://v.jspang.com:8088/baixing/';

const homePageContext = 'homePageContext';
const homePageBelowConten = 'homePageBelowConten';
const getCategory = 'getCategory';
const getMallGoods = 'getMallGoods';
const getGoodDetailById = 'getGoodDetailById';

const servicePath = {
  //商家首页信息
  homePageContext:serviceUrl + 'wxmini/homePageContent',
  //商城首页热卖商品拉取
  homePageBelowConten:serviceUrl + 'wxmini/homePageBelowConten',
  //商品类别信息
  getCategory:serviceUrl + 'wxmini/getCategory',
  //商品分类的商品列表
  getMallGoods:serviceUrl + 'wxmini/getMallGoods',
  //商品详细信息列表
  getGoodDetailById:serviceUrl + 'wxmini/getGoodDetailById'
};