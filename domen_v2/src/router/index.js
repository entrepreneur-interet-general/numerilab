import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Guide from '@/components/Guide'
import Contact from '@/components/Contact'
import FunctionalDomain from '@/components/FunctionalDomain/FunctionalDomain'
import CreateFunctionalDomain from '@/components/FunctionalDomain/CreateFunctionalDomain'
import Profile from '@/components/User/Profile'
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
      component: FunctionalDomain
    },
    {
      path: '/domainefonctionnel/new',
      name: 'CreateDomaineFonctionnel',
      component: CreateFunctionalDomain
    },
    {
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
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/signup',
      name: 'SignUp',
      component: SignUp
    }
  ],
  mode: 'history'
})
