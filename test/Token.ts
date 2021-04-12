import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers'
import { ZCX } from '../typechain/ZCX'
import { TokenFarm } from '../typechain/TokenFarm'
import { expect } from 'chai'
import { ethers } from 'hardhat'

describe('TokenFarm contract', () => {
  let zcx: ZCX
  let tokenFarm: TokenFarm
  let owner: SignerWithAddress
  let addr1: SignerWithAddress
  let addr2: SignerWithAddress

  beforeEach('deploy', async () => {
    [owner, addr1, addr2] = await ethers.getSigners()

    const ZCX = await ethers.getContractFactory('ZCX')
    zcx = (await ZCX.deploy()) as ZCX
    zcx.initialize("ZCX", "ZCX");

    const TokenFarm = await ethers.getContractFactory('TokenFarm')
    tokenFarm = (await TokenFarm.deploy(zcx.address)) as TokenFarm
  })

  it('ZCX token contract is deployed', async () => {
    expect(zcx.address).to.not.be.undefined
  })

  it('TokenFarm contract is deployed', async () => {
    expect(tokenFarm.address).to.not.be.undefined
  })

  it('ZCX token contract has the correct symbol', async () => {
    expect(await zcx.symbol()).to.equal('ZCX')
  })

})
