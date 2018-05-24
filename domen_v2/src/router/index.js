import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Guide from '@/components/Guide'
import DomaineFonctionnel from '@/components/DomaineFonctionnel/DomaineFonctionnel'
import CreateDomaineFonctionnel from '@/components/DomaineFonctionnel/CreateDomaineFonctionnel'
import Profile from '@/components/User/Profile'
import Search from '@/components/search/Search'
import SignIn from '@/components/User/SignIn'
import SignUp from '@/components/User/SignUp'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/domainefonctionnel',
      name: 'DomaineFonctionnel',
      component: DomaineFonctionnel
    },
    {
      path: '/search',
      name: 'search',
      component: Search
    },
    {
      path: '/domainefonctionnel/new',
      name: 'CreateDomaineFonctionnel',
      component: CreateDomaineFonctionnel
    }, {
      path: '/profile',
      name: 'Profile',
      component: Profile
    },
    {
      path: '/signin',
      name: 'SignIn',
      component: SignIn
    },
    {
      path: '/guide',
      name: 'Guide',
      component: Guide
    },
    {
      path: '/signup',
      name: 'SignUp',
      component: SignUp
    }
  ],
  mode: 'history'
})
